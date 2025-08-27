// lib/features/tracking/presentation/screens/scanner_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/features/subscription/presentation/providers/subscription_provider.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/tracking/presentation/widgets/product_details_sheet.dart';
import 'package:quit_suggar/features/tracking/presentation/widgets/custom_dialog.dart';
import 'package:quit_suggar/features/subscription/presentation/screens/revenuecat_paywall_screen.dart';

class ScannerScreen extends HookConsumerWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Scanner controller to pause/resume scanning
    final scannerController = useMemoized(() => MobileScannerController());

    // Use a flag to prevent multiple sheets from opening
    final isProcessing = useState(false);
    final scannerPaused = useState(false);

    // Dispose controller when widget is disposed
    useEffect(() {
      return () => scannerController.dispose();
    }, []);

    AppLogger.logScanner('Scanner screen opened');

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        middle: Text(
          'Scan Product',
          style: AppTextStyles.heading.copyWith(fontSize: 18),
        ),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            AppLogger.logNavigation('Scanner screen closed by back button');
            context.pop();
          },
        ),
      ),
      child: Stack(
        children: [
          MobileScanner(
            controller: scannerController,
            onDetect: (capture) async {
              // Prevent multiple processing
              if (isProcessing.value || scannerPaused.value) {
                AppLogger.logScanner(
                  'Already processing a barcode or scanner paused, ignoring new scan',
                );
                return;
              }

              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                final String? code = barcodes.first.rawValue;
                if (code != null) {
                  AppLogger.logScanner('Barcode detected: $code');
                  isProcessing.value = true;

                  // Pause scanning immediately to prevent multiple scans
                  scannerPaused.value = true;
                  await scannerController.stop();

                  try {
                    // Store context mounted state before async operations
                    if (!context.mounted) return;

                    // Check subscription limits before processing scan
                    final canScan = await _checkScanLimits(context, ref);
                    if (!canScan) {
                      // User hit scan limits, don't process the scan
                      return;
                    }

                    // Record the scan attempt
                    await ref.read(subscriptionProvider.notifier).recordScan();

                    // Fetch product info and show details
                    if (context.mounted) {
                      await _showProductDetails(
                        context,
                        ref,
                        code,
                        scannerController,
                        scannerPaused,
                      );
                    }
                  } finally {
                    // Reset the processing flag
                    isProcessing.value = false;
                  }
                }
              }
            },
          ),
          // Resume scanning button overlay
          if (scannerPaused.value)
            Positioned(
              bottom: 100,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlack,
                  borderRadius: BorderRadius.zero, // Sharp corners
                  border: Border.all(color: AppTheme.borderDefault, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 0,
                      offset: const Offset(4, 4), // Right and bottom shadow
                    ),
                  ],
                ),
                child: CupertinoButton(
                  onPressed: () async {
                    AppLogger.logScanner('Resuming scanner');
                    scannerPaused.value = false;
                    await scannerController.start();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        CupertinoIcons.camera,
                        color: AppTheme.primaryWhite,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Tap to Scan Again',
                        style: AppTextStyles.heading.copyWith(
                          color: AppTheme.primaryWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _showProductDetails(
    BuildContext context,
    WidgetRef ref,
    String barcode,
    MobileScannerController scannerController,
    ValueNotifier<bool> scannerPaused,
  ) async {
    AppLogger.logScanner('Fetching product details for barcode: $barcode');

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const CustomDialog(
        title: 'Loading',
        content: 'Fetching product information...',
        actions: [],
        showLoading: true,
      ),
    );

    // Fetch product from OpenFoodFacts via provider
    final product = await ref.read(productByBarcodeProvider(barcode).future);

    // Dismiss loading dialog
    if (context.mounted) {
      context.pop();
    }

    if (product != null) {
      AppLogger.logScanner('Product found, showing bottom sheet');
      // Show product details in bottom sheet
      if (context.mounted) {
        await _showProductBottomSheet(
          context,
          ref,
          product,
          scannerController,
          scannerPaused,
        );
      }
    } else {
      AppLogger.logScanner('Product not found, showing error dialog');
      // Show error dialog
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            title: 'Product Not Found',
            content:
                'This product was not found in our database. You can add it manually.',
            actions: [
              CustomDialogAction(
                text: 'OK',
                onPressed: () {
                  AppLogger.logUserAction('Dismissed product not found dialog');
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }

      // Auto-resume scanning after error dialog
      Future.delayed(const Duration(seconds: 1), () async {
        if (!scannerPaused.value) return; // Already resumed
        AppLogger.logScanner('Auto-resuming scanner after error');
        scannerPaused.value = false;
        await scannerController.start();
      });
    }
  }

  Future<void> _showProductBottomSheet(
    BuildContext context,
    WidgetRef ref,
    ProductInfo product,
    MobileScannerController scannerController,
    ValueNotifier<bool> scannerPaused,
  ) async {
    double selectedPortion = 100.0; // Default to 100g
    final parentContext = context; // Store parent context

    AppLogger.logScanner('Showing product bottom sheet for: ${product.name}');

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ProductDetailsSheet(
        product: product,
        selectedPortion: selectedPortion,
        onPortionChanged: (value) {
          selectedPortion = value;
          AppLogger.logUserAction('Adjusted portion size', {
            'portion_grams': value,
          });
        },
        onAddToDailyLog: () async {
          AppLogger.logUserAction('Confirmed adding product to daily log', {
            'product_name': product.name,
            'portion_grams': selectedPortion,
          });
          context.pop();
          // Use parent context instead of bottom sheet context
          await _addProductToDailyLog(
            parentContext,
            ref,
            product,
            selectedPortion,
          );
        },
      ),
    );

    // Auto-resume scanning when bottom sheet is dismissed
    if (scannerPaused.value) {
      AppLogger.logScanner('Auto-resuming scanner after bottom sheet closed');
      scannerPaused.value = false;
      await scannerController.start();
    }
  }

  Future<void> _addProductToDailyLog(
    BuildContext context,
    WidgetRef ref,
    ProductInfo product,
    double portion,
  ) async {
    AppLogger.logSugarTracking('Adding product to daily log: ${product.name}');

    // Calculate the sugar amount for this specific product and portion
    final sugarForThisPortion = product.calculateSugarForPortion(portion);

    final success = await ref
        .read(sugarTrackingProvider.notifier)
        .addProductEntry(product, portion);

    if (success) {
      // Wait for provider to update and get fresh data
      final sugarTrackingService = await ref.read(sugarTrackingProvider.future);
      final summary = sugarTrackingService.getDailySummary();

      AppLogger.logSugarTracking('Product successfully added to daily log');

      if (context.mounted) {
        // Generate personalized feedback based on sugar content and progress
        final feedbackData = _generateTrackingFeedback(product, sugarForThisPortion, summary);
        
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            title: feedbackData['title']!,
            content: feedbackData['content']!,
            actions: [
              CustomDialogAction(
                text: 'Continue Scanning',
                onPressed: () {
                  AppLogger.logUserAction('Chose to continue scanning');
                  Navigator.of(context).pop();
                },
              ),
              CustomDialogAction(
                text: 'Done',
                onPressed: () {
                  AppLogger.logUserAction('Chose to finish scanning');
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.of(context).pop(); // Close scanner screen
                },
              ),
            ],
          ),
        );
      }
    } else {
      AppLogger.logSugarTrackingError(
        'Failed to add product to daily log: ${product.name}',
      );

      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            title: 'Error',
            content: 'Failed to add product to daily log. Please try again.',
            actions: [
              CustomDialogAction(
                text: 'OK',
                onPressed: () {
                  AppLogger.logUserAction('Dismissed error dialog');
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  /// Generate personalized feedback based on product and user progress
  Map<String, String> _generateTrackingFeedback(
    ProductInfo product,
    double sugarAdded,
    dynamic summary, // DailySummary from sugar tracking service
  ) {
    final sugarPer100g = product.sugarPer100g ?? 0.0;
    final progressPercentage = (summary.totalSugar / summary.dailyLimit) * 100;
    final remainingSugar = summary.dailyLimit - summary.totalSugar;
    
    String title;
    String content;
    
    // Determine feedback based on product sugar content and user progress
    if (sugarPer100g < 5.0) {
      // Low sugar product
      title = '🌟 Great Choice!';
      content = 'Excellent! ${product.name} is low in sugar (${sugarPer100g.toStringAsFixed(1)}g per 100g).\n\nSugar added: ${sugarAdded.toStringAsFixed(1)}g\nToday\'s Total: ${summary.totalSugar.toStringAsFixed(1)}g / ${summary.dailyLimit.toStringAsFixed(0)}g\n\nYou\'re making smart choices! Keep it up! 💪';
    } else if (sugarPer100g < 10.0) {
      // Moderate sugar product
      title = '👍 Good Choice!';
      content = '${product.name} has moderate sugar content (${sugarPer100g.toStringAsFixed(1)}g per 100g).\n\nSugar added: ${sugarAdded.toStringAsFixed(1)}g\nToday\'s Total: ${summary.totalSugar.toStringAsFixed(1)}g / ${summary.dailyLimit.toStringAsFixed(0)}g\n\nStill within a reasonable range. You\'re doing well!';
    } else if (sugarPer100g < 20.0) {
      // High sugar product
      title = '⚠️ High Sugar Alert';
      content = '${product.name} is high in sugar (${sugarPer100g.toStringAsFixed(1)}g per 100g).\n\nSugar added: ${sugarAdded.toStringAsFixed(1)}g\nToday\'s Total: ${summary.totalSugar.toStringAsFixed(1)}g / ${summary.dailyLimit.toStringAsFixed(0)}g';
      
      if (progressPercentage > 80) {
        content += '\n\n🔴 You\'re close to your daily limit! Consider healthier alternatives tomorrow.';
      } else {
        content += '\n\n💡 Try to balance this with lower-sugar foods today.';
      }
    } else {
      // Very high sugar product
      title = '🚨 Very High Sugar!';
      content = '${product.name} is very high in sugar (${sugarPer100g.toStringAsFixed(1)}g per 100g).\n\nSugar added: ${sugarAdded.toStringAsFixed(1)}g\nToday\'s Total: ${summary.totalSugar.toStringAsFixed(1)}g / ${summary.dailyLimit.toStringAsFixed(0)}g';
      
      if (progressPercentage >= 100) {
        content += '\n\n🔴 You\'ve exceeded your daily limit. Consider this a learning experience!';
      } else if (progressPercentage > 80) {
        content += '\n\n⚠️ This puts you very close to your daily limit. Be extra careful with the rest of your day!';
      } else {
        content += '\n\n💡 This is a high-sugar item. Try to make healthier choices for the rest of the day.';
      }
    }
    
    // Add progress encouragement
    if (progressPercentage <= 50) {
      content += '\n\n✅ You have plenty of room left in your daily budget: ${remainingSugar.toStringAsFixed(1)}g remaining!';
    } else if (progressPercentage <= 75) {
      content += '\n\n⏰ You\'re at ${progressPercentage.toStringAsFixed(0)}% of your daily limit. ${remainingSugar.toStringAsFixed(1)}g remaining.';
    }
    
    return {
      'title': title,
      'content': content,
    };
  }

  /// Check if user can scan based on subscription limits
  Future<bool> _checkScanLimits(BuildContext context, WidgetRef ref) async {
    try {
      final canScan = await ref.read(subscriptionProvider.notifier).canScan();

      if (!canScan && context.mounted) {
        // Show paywall for scan limit reached
        AppLogger.logUserAction('Scan limit reached, showing paywall');

        await Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) =>
                const RevenueCatPaywallScreen(source: 'scan_limit'),
          ),
        );

        // After paywall, check again if user upgraded
        return await ref.read(subscriptionProvider.notifier).canScan();
      }

      return canScan;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Error checking scan limits',
        e,
        stackTrace,
      );
      return false; // Fail safe - don't allow scan if there's an error
    }
  }
}
