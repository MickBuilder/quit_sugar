import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/features/tracking/presentation/widgets/sugar_swap_suggestions.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class ProductDetailsSheet extends HookWidget {
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
    final showSuggestions = useState(true);
    // Calculate sugar amount dynamically based on current portion size
    final sugarAmount = product.calculateSugarForPortion(selectedPortion);

    // Set max portion size based on product weight, with fallback to 500g
    final maxPortion = product.weightGrams != null
        ? (product.weightGrams!).clamp(50.0, 2000.0)
        : 500.0;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.textMuted,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              product.name,
              style: AppTextStyles.heading.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 20),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Sugar content display
                Container(
                  decoration: AppCardStyles.primary,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sugar Content',
                        style: AppTextStyles.heading.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${sugarAmount.toStringAsFixed(1)}g sugar',
                              style: AppTextStyles.display.copyWith(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          if (product.sugarPer100g != null)
                            Text(
                              '(${product.sugarPer100g!.toStringAsFixed(1)}g per 100g)',
                              style: AppTextStyles.subtitle,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Portion size selector
                Container(
                  decoration: AppCardStyles.primary,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Portion Size',
                        style: AppTextStyles.heading.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoSlider(
                              value: selectedPortion,
                              min: 10.0,
                              max: maxPortion,
                              divisions: ((maxPortion - 10.0) / 10.0).round(),
                              activeColor: AppTheme.primaryBlack,
                              thumbColor: AppTheme.primaryBlack,
                              onChanged: onPortionChanged,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            decoration: AppCardStyles.primary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Text(
                              '${selectedPortion.round()}g',
                              style: AppTextStyles.subtitle.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Sugar swap suggestions (only show for high-sugar products)
                if (showSuggestions.value && (product.sugarPer100g ?? 0.0) > 15.0) ...[
                  const SizedBox(height: 16),
                  SugarSwapSuggestions(
                    scannedProduct: product,
                    onDismiss: () => showSuggestions.value = false,
                  ),
                ],

                const SizedBox(height: 20),

                // Add to daily log button
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: AppCardStyles.button,
                    child: CupertinoButton(
                      onPressed: onAddToDailyLog,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Add to Daily Log',
                        style: AppTextStyles.title.copyWith(
                          color: AppTheme.primaryWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
