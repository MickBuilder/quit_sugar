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
      decoration: AppCardStyles.primary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with dismiss button
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.accentGreen,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.primaryBlack, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                        blurRadius: 0,
                        offset: const Offset(2, 2),
                      ),
                    ],
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
                        'Healthier Alternatives',
                        style: AppTextStyles.title.copyWith(
                          fontSize: 18,
                          color: AppTheme.primaryBlack,
                        ),
                      ),
                      Text(
                        '${sugarPer100g.toStringAsFixed(1)}g sugar per 100g',
                        style: AppTextStyles.caption.copyWith(
                          color: AppTheme.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                if (onDismiss != null)
                  GestureDetector(
                    onTap: onDismiss,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppTheme.borderDefault,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                            blurRadius: 0,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        CupertinoIcons.xmark,
                        size: 16,
                        color: AppTheme.primaryBlack,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Main message
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _getSwapMessage(scannedProduct),
              style: AppTextStyles.body.copyWith(
                fontSize: 15,
                color: AppTheme.textPrimary,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Alternatives list with horizontal scrolling
          SizedBox(
            height: 200,
            child: Consumer(
              builder: (context, ref, child) {
                final recommendationsAsync = ref.watch(
                  sugarSwapRecommendationsProvider(scannedProduct),
                );

                return recommendationsAsync.when(
                  data: (recommendations) {
                    if (recommendations == null ||
                        recommendations.alternatives.isEmpty) {
                      // Show message when no alternatives found
                      return _buildNoAlternativesMessage();
                    }

                    // Show alternatives with horizontal scrolling
                    final topAlternatives = recommendations.topAlternatives;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: topAlternatives.length,
                      itemBuilder: (context, index) {
                        return _buildAlternativeProductCard(
                          topAlternatives[index],
                        );
                      },
                    );
                  },
                  loading: () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                  error: (error, _) => _buildNoAlternativesMessage(),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Track anyway button
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () => _trackAnyway(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: AppCardStyles.primary,
                child: Center(
                  child: Text(
                    'Track Anyway',
                    style: AppTextStyles.button.copyWith(
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoAlternativesMessage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.accentGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.accentGreen, width: 2),
              ),
              child: const Icon(
                CupertinoIcons.lightbulb,
                color: AppTheme.accentGreen,
                size: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No alternatives found',
              style: AppTextStyles.title.copyWith(
                fontSize: 16,
                color: AppTheme.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Try searching for similar products with less sugar',
              style: AppTextStyles.body.copyWith(
                fontSize: 14,
                color: AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlternativeProductCard(dynamic alternative) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: AppCardStyles.elevated,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image with overlay badge
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 100, // Slightly reduced height
                decoration: BoxDecoration(
                  color: AppTheme.accentGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: alternative.product.imageUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          alternative.product.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildProductPlaceholder();
                          },
                        ),
                      )
                    : _buildProductPlaceholder(),
              ),
              // Savings badge overlay on top right
              Positioned(
                top: 2,
                right: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.accentGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppTheme.accentGreen, width: 1),
                  ),
                  child: Text(
                    'Save ${alternative.sugarReduction.toStringAsFixed(1)}g',
                    style: AppTextStyles.caption.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.accentGreen,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Product name
          Text(
            alternative.product.name,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 4),

          // Sugar content
          Text(
            '${alternative.alternativeSugar.toStringAsFixed(1)}g per 100g',
            style: AppTextStyles.caption.copyWith(
              color: AppTheme.textMuted,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductPlaceholder() {
    return Container(
      width: double.infinity,
      height: 100, // Match the image height
      decoration: BoxDecoration(
        color: AppTheme.accentGreen.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        // No border as requested
      ),
      child: const Icon(
        CupertinoIcons.cube,
        color: AppTheme.accentGreen,
        size: 24,
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

  void _trackAnyway(BuildContext context) {
    // Close the suggestions and proceed with tracking
    if (onDismiss != null) {
      onDismiss!();
    }
  }
}
