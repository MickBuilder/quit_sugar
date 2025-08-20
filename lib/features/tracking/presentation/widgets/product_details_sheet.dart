import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/services/openfoodfacts_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProductDetailsSheet extends StatelessWidget {
  final ProductInfo product;
  final double selectedPortion;
  final ValueChanged<double> onPortionChanged;
  final VoidCallback onAddToDailyLog;

  const ProductDetailsSheet({
    super.key,
    required this.product,
    required this.selectedPortion,
    required this.onPortionChanged,
    required this.onAddToDailyLog,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate sugar amount dynamically based on current portion size
    final sugarAmount = product.calculateSugarForPortion(selectedPortion);
    
    // Set max portion size based on product weight, with fallback to 500g
    final maxPortion = product.weightGrams != null 
        ? (product.weightGrams! * 2.0).clamp(50.0, 2000.0) // Allow up to 2x product weight, clamped between 50g-2kg
        : 500.0; // Fallback to 500g if no weight info
    
    return ShadSheet(
      title: Text(
        product.name,
        style: EmotionalTextStyles.motivational.copyWith(fontSize: 18),
      ),
      description: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.brand != null)
            Text('Brand: ${product.brand}', style: EmotionalTextStyles.supportive),
          if (product.weightGrams != null)
            Text('Package: ${product.weightGrams!.toStringAsFixed(0)}g', 
                 style: EmotionalTextStyles.supportive.copyWith(fontSize: 12)),
        ],
      ),
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
                  max: maxPortion,
                  divisions: ((maxPortion - 10) / 10).round(),
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