import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/sugar_swap_provider.dart';

class SugarSwapSuggestions extends HookConsumerWidget {
  final ProductInfo scannedProduct;
  final VoidCallback? onDismiss;

  const SugarSwapSuggestions({
    super.key,
    required this.scannedProduct,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sugarPer100g = scannedProduct.sugarPer100g ?? 0.0;
    
    // Only show suggestions for high-sugar products
    if (sugarPer100g < 10.0) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.accentOrange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.accentOrange,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlack.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with warning
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.accentOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  CupertinoIcons.lightbulb,
                  color: AppTheme.primaryWhite,
                  size: 16,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sugar Swap Suggestion',
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.accentOrange,
                      ),
                    ),
                    Text(
                      '${sugarPer100g.toStringAsFixed(1)}g sugar per 100g',
                      style: AppTextStyles.caption.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (onDismiss != null)
                GestureDetector(
                  onTap: onDismiss,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      CupertinoIcons.xmark,
                      size: 16,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Main message
          Text(
            _getSwapMessage(scannedProduct),
            style: AppTextStyles.body.copyWith(
              fontSize: 15,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Show 3 alternative products directly
          Consumer(
            builder: (context, ref, child) {
              final recommendationsAsync = ref.watch(sugarSwapRecommendationsProvider(scannedProduct));
              
              return recommendationsAsync.when(
                data: (recommendations) {
                  if (recommendations == null || recommendations.alternatives.isEmpty) {
                    // Fallback to static suggestions if no alternatives found
                    return Column(
                      children: [
                        ..._getStaticSuggestions(scannedProduct).take(3).map((suggestion) =>
                          _buildSuggestionItem(suggestion),
                        ),
                      ],
                    );
                  }
                  
                  // Show top 3 alternatives with product details
                  final topAlternatives = recommendations.topAlternatives;
                  return Column(
                    children: topAlternatives.map((alt) => 
                      _buildAlternativeProductCard(alt),
                    ).toList(),
                  );
                },
                loading: () => Column(
                  children: [
                    const CupertinoActivityIndicator(),
                    const SizedBox(height: 8),
                    Text(
                      'Finding alternatives...',
                      style: AppTextStyles.caption.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
                error: (error, _) => Column(
                  children: [
                    ..._getStaticSuggestions(scannedProduct).take(3).map((suggestion) =>
                      _buildSuggestionItem(suggestion),
                    ),
                  ],
                ),
              );
            },
          ),
          
          const SizedBox(height: 16),
          
          // Track anyway button
          GestureDetector(
            onTap: () => _trackAnyway(context),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.surfaceBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppTheme.borderDefault,
                  width: 1,
                ),
              ),
              child: const Center(
                child: Text(
                  'Track Anyway',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionItem(String suggestion) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppTheme.accentOrange,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              suggestion,
              style: AppTextStyles.body.copyWith(
                fontSize: 14,
                color: AppTheme.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlternativeProductCard(dynamic alternative) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Product icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.progressGreen.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              CupertinoIcons.checkmark_alt,
              size: 20,
              color: AppTheme.progressGreen,
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alternative.product.name,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 2),
                
                Text(
                  '${alternative.alternativeSugar.toStringAsFixed(1)}g sugar per 100g',
                  style: AppTextStyles.caption.copyWith(
                    color: AppTheme.textMuted,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          
          // Sugar reduction info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Save ${alternative.sugarReduction.toStringAsFixed(1)}g',
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppTheme.progressGreen,
                  fontSize: 14,
                ),
              ),
              Text(
                '${alternative.sugarReductionPercent.toStringAsFixed(0)}% less',
                style: AppTextStyles.caption.copyWith(
                  color: AppTheme.progressGreen,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getSwapMessage(ProductInfo product) {
    final sugar = product.sugarPer100g ?? 0.0;
    
    if (sugar >= 25.0) {
      return 'This is very high in sugar! Consider these healthier alternatives:';
    } else if (sugar >= 15.0) {
      return 'This product has quite a bit of sugar. Here are some better options:';
    } else {
      return 'Looking for something with even less sugar? Try these:';
    }
  }

  List<String> _getStaticSuggestions(ProductInfo product) {
    final productName = product.name.toLowerCase();
    
    // Basic category-based suggestions
    if (productName.contains('soda') || productName.contains('cola') || productName.contains('soft drink')) {
      return [
        'Try sparkling water with a splash of fruit juice',
        'Zero-sugar sodas or diet versions',
        'Flavored sparkling water (LaCroix, Perrier)',
        'Homemade iced tea with stevia',
      ];
    }
    
    if (productName.contains('juice') || productName.contains('drink')) {
      return [
        'Dilute with sparkling water (50/50 mix)',
        'Fresh fruit infused water',
        'Unsweetened tea or coffee',
        'Low-sugar vegetable juices',
      ];
    }
    
    if (productName.contains('yogurt') || productName.contains('yoghurt')) {
      return [
        'Plain Greek yogurt with fresh berries',
        'Unsweetened yogurt with a drizzle of honey',
        'Plant-based unsweetened yogurt',
        'Cottage cheese with fruit',
      ];
    }
    
    if (productName.contains('cereal') || productName.contains('granola')) {
      return [
        'Low-sugar cereals (check labels for <6g sugar)',
        'Plain oatmeal with fresh fruit',
        'Homemade granola with nuts and seeds',
        'Whole grain cereals without added sugar',
      ];
    }
    
    if (productName.contains('cookie') || productName.contains('biscuit') || productName.contains('candy')) {
      return [
        'Fresh fruit (apple, berries, orange)',
        'Nuts and seeds mix',
        'Dark chocolate (85%+ cacao)',
        'Homemade energy balls with dates',
      ];
    }
    
    // Default suggestions
    return [
      'Look for "no added sugar" or "unsweetened" versions',
      'Try the same product in smaller portions',
      'Consider natural alternatives without artificial sweeteners',
      'Check if there\'s a diet or light version available',
    ];
  }


  void _trackAnyway(BuildContext context) {
    // Close the suggestions and proceed with tracking
    if (onDismiss != null) {
      onDismiss!();
    }
  }
}