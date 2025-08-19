// lib/features/tracking/presentation/screens/scanner_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:quit_suggar/core/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/services/openfoodfacts_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ScannerScreen extends HookConsumerWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use a flag to prevent multiple sheets from opening
    final isProcessing = useState(false);
    
    AppLogger.logScanner('Scanner screen opened');
    
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.darkBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.darkBackground,
        border: const Border(bottom: BorderSide.none),
        middle: Text(
          'Scan Product',
          style: EmotionalTextStyles.motivational.copyWith(fontSize: 18),
        ),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            AppLogger.logNavigation('Scanner screen closed by back button');
            Navigator.of(context).pop();
          },
        ),
      ),
      child: MobileScanner(
        onDetect: (capture) async {
          // Prevent multiple processing
          if (isProcessing.value) {
            AppLogger.logScanner('Already processing a barcode, ignoring new scan');
            return;
          }
          
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            final String? code = barcodes.first.rawValue;
            if (code != null) {
              AppLogger.logScanner('Barcode detected: $code');
              isProcessing.value = true;
              
              try {
                // Fetch product info and show details
                await _showProductDetails(context, ref, code);
              } finally {
                // Reset the flag after processing
                isProcessing.value = false;
              }
            }
          }
        },
      ),
    );
  }

  Future<void> _showProductDetails(BuildContext context, WidgetRef ref, String barcode) async {
    AppLogger.logScanner('Fetching product details for barcode: $barcode');
    
    // Show loading dialog
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const CupertinoAlertDialog(
        content: Column(
          children: [
            CupertinoActivityIndicator(),
            SizedBox(height: 16),
            Text('Fetching product information...'),
          ],
        ),
      ),
    );

    // Fetch product from OpenFoodFacts
    final product = await OpenFoodFactsService.getProductByBarcode(barcode);
    
    // Dismiss loading dialog
    Navigator.of(context).pop();

    if (product != null) {
      AppLogger.logScanner('Product found, showing bottom sheet');
      // Show product details in bottom sheet
      await _showProductBottomSheet(context, ref, product);
    } else {
      AppLogger.logScanner('Product not found, showing error dialog');
      // Show error dialog
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Product Not Found'),
          content: const Text('This product was not found in our database. You can add it manually.'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                AppLogger.logUserAction('Dismissed product not found dialog');
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  Future<void> _showProductBottomSheet(BuildContext context, WidgetRef ref, ProductInfo product) async {
    double selectedPortion = 100.0; // Default to 100g
    final sugarAmount = product.calculateSugarForPortion(selectedPortion);
    
    AppLogger.logScanner('Showing product bottom sheet for: ${product.name}');
    
    showShadSheet(
      side: ShadSheetSide.bottom,
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => ProductDetailsSheet(
          product: product,
          selectedPortion: selectedPortion,
          sugarAmount: sugarAmount,
          onPortionChanged: (value) {
            setState(() {
              selectedPortion = value;
            });
            AppLogger.logUserAction('Adjusted portion size', {'portion_grams': value});
          },
          onAddToDailyLog: () async {
            AppLogger.logUserAction('Confirmed adding product to daily log', {
              'product_name': product.name,
              'portion_grams': selectedPortion,
            });
            Navigator.of(context).pop();
            await _addProductToDailyLog(context, ref, product, selectedPortion);
          },
        ),
      ),
    );
  }

  Future<void> _addProductToDailyLog(BuildContext context, WidgetRef ref, ProductInfo product, double portion) async {
    AppLogger.logSugarTracking('Adding product to daily log: ${product.name}');
    
    final success = await ref.read(sugarTrackingProvider.notifier).addScannedProduct(product.barcode, portion);
    
    if (success) {
      final summary = ref.read(sugarTrackingProvider.notifier).getDailySummary();
      
      AppLogger.logSugarTracking('Product successfully added to daily log');
      
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Added Successfully!'),
          content: Column(
            children: [
              Text(
                'Added ${product.name} to your daily log.',
                style: EmotionalTextStyles.supportive,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: CardStyles.progress,
                child: Column(
                  children: [
                    Text(
                      'Today\'s Total: ${summary.totalSugar.toStringAsFixed(1)}g / ${summary.dailyLimit.toStringAsFixed(0)}g',
                      style: EmotionalTextStyles.progress,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      summary.motivationalMessage,
                      style: EmotionalTextStyles.supportive,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('Continue Scanning'),
              onPressed: () {
                AppLogger.logUserAction('Chose to continue scanning');
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('Done'),
              onPressed: () {
                AppLogger.logUserAction('Chose to finish scanning');
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } else {
      AppLogger.logSugarTrackingError('Failed to add product to daily log: ${product.name}');
      
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to add product to daily log. Please try again.'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
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

class ProductDetailsSheet extends StatelessWidget {
  final ProductInfo product;
  final double selectedPortion;
  final double sugarAmount;
  final ValueChanged<double> onPortionChanged;
  final VoidCallback onAddToDailyLog;

  const ProductDetailsSheet({
    super.key,
    required this.product,
    required this.selectedPortion,
    required this.sugarAmount,
    required this.onPortionChanged,
    required this.onAddToDailyLog,
  });

  @override
  Widget build(BuildContext context) {    
    return ShadSheet(
      title: Text(
        product.name,
        style: EmotionalTextStyles.motivational.copyWith(fontSize: 18),
      ),
      description: product.brand != null 
          ? Text('Brand: ${product.brand}', style: EmotionalTextStyles.supportive)
          : null,
      actions: [
        ShadButton.outline(
          child: const Text('Cancel'),
          onPressed: () {
            AppLogger.logUserAction('Cancelled adding product to daily log');
            Navigator.of(context).pop();
          },
        ),
        if (product.sugarPer100g != null)
          ShadButton(
            onPressed: onAddToDailyLog,
            child: const Text('Add to Daily Log'),
          ),
      ],
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              if (product.sugarPer100g != null) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: CardStyles.warning,
                  child: Column(
                    children: [
                      Text(
                        'Sugar Content',
                        style: EmotionalTextStyles.motivational.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${product.sugarPer100g!.toStringAsFixed(1)}g per 100g',
                        style: EmotionalTextStyles.warning,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Portion Size',
                  style: EmotionalTextStyles.motivational.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 8),
                CupertinoSlider(
                  value: selectedPortion,
                  min: 10.0,
                  max: 500.0,
                  divisions: 49,
                  onChanged: onPortionChanged,
                ),
                Text(
                  '${selectedPortion.toStringAsFixed(0)}g',
                  style: EmotionalTextStyles.progress.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: CardStyles.progress,
                  child: Column(
                    children: [
                      Text(
                        'Sugar in this portion',
                        style: EmotionalTextStyles.motivational.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${sugarAmount.toStringAsFixed(1)}g',
                        style: EmotionalTextStyles.progress.copyWith(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ] else ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: CardStyles.warning,
                  child: Column(
                    children: [
                      const Icon(
                        CupertinoIcons.exclamationmark_triangle,
                        color: AppTheme.warningRed,
                        size: 32,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sugar content not available for this product.',
                        style: EmotionalTextStyles.warning,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}