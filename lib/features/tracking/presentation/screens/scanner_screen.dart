// lib/features/tracking/presentation/screens/scanner_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:quit_suggar/core/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/services/openfoodfacts_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class ScannerScreen extends HookConsumerWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            final String? code = barcodes.first.rawValue;
            if (code != null) {
              AppLogger.logScanner('Barcode detected: $code');
              // Fetch product info and show details
              await _showProductDetails(context, ref, code);
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
      AppLogger.logScanner('Product found, showing details dialog');
      // Show product details dialog
      await _showProductDialog(context, ref, product);
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

  Future<void> _showProductDialog(BuildContext context, WidgetRef ref, ProductInfo product) async {
    double selectedPortion = 100.0; // Default to 100g
    final sugarAmount = product.calculateSugarForPortion(selectedPortion);
    
    AppLogger.logScanner('Showing product dialog for: ${product.name}');
    
    showCupertinoDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => CupertinoAlertDialog(
          title: Text(
            product.name,
            style: EmotionalTextStyles.motivational.copyWith(fontSize: 16),
          ),
          content: Column(
            children: [
              if (product.brand != null) ...[
                Text(
                  'Brand: ${product.brand}',
                  style: EmotionalTextStyles.supportive,
                ),
                const SizedBox(height: 8),
              ],
              if (product.sugarPer100g != null) ...[
                Text(
                  'Sugar: ${product.sugarPer100g!.toStringAsFixed(1)}g per 100g',
                  style: EmotionalTextStyles.warning,
                ),
                const SizedBox(height: 16),
                Text(
                  'Portion Size:',
                  style: EmotionalTextStyles.supportive,
                ),
                const SizedBox(height: 8),
                CupertinoSlider(
                  value: selectedPortion,
                  min: 10.0,
                  max: 500.0,
                  divisions: 49,
                  onChanged: (value) {
                    setState(() {
                      selectedPortion = value;
                    });
                    AppLogger.logUserAction('Adjusted portion size', {'portion_grams': value});
                  },
                ),
                Text(
                  '${selectedPortion.toStringAsFixed(0)}g',
                  style: EmotionalTextStyles.progress.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: CardStyles.warning,
                  child: Text(
                    'Sugar in this portion: ${sugarAmount.toStringAsFixed(1)}g',
                    style: EmotionalTextStyles.warning.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ] else ...[
                const Text(
                  'Sugar content not available for this product.',
                  style: TextStyle(color: AppTheme.textSecondary),
                ),
              ],
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                AppLogger.logUserAction('Cancelled adding product to daily log');
                Navigator.of(context).pop();
              },
            ),
            if (product.sugarPer100g != null)
              CupertinoDialogAction(
                child: const Text('Add to Daily Log'),
                onPressed: () async {
                  AppLogger.logUserAction('Confirmed adding product to daily log', {
                    'product_name': product.name,
                    'portion_grams': selectedPortion,
                  });
                  Navigator.of(context).pop();
                  await _addProductToDailyLog(context, ref, product, selectedPortion);
                },
              ),
          ],
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