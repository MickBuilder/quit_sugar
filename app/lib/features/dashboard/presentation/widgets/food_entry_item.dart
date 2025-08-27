import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class FoodEntryItem extends StatelessWidget {
  final FoodEntry entry;

  const FoodEntryItem({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceBackground.withValues(alpha: .5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderDefault),
      ),
      child: Row(
        children: [
          // Product image
          Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.borderDefault,
            ),
            child: entry.product.imageUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      entry.product.imageUrl!,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlaceholderImage();
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CupertinoActivityIndicator(radius: 8),
                        );
                      },
                    ),
                  )
                : _buildPlaceholderImage(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.displayName,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                if (entry.product.brand != null) ...[
                  Text(
                    entry.product.brand!,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 11,
                      color: AppTheme.textSecondary.withValues(alpha: .7),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                ],
                if (!_isManualEntry(entry)) ...[
                  Text(
                    '${entry.portionGrams.toStringAsFixed(0)}g portion',
                    style: AppTextStyles.body.copyWith(fontSize: 12),
                  ),
                ],
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.accentOrange.withValues(alpha: .2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${entry.sugarAmount.toStringAsFixed(1)}g',
              style: AppTextStyles.button.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppTheme.borderDefault,
      ),
      child: const Icon(
        CupertinoIcons.cube,
        color: AppTheme.surfaceBackground,
        size: 24,
      ),
    );
  }

  bool _isManualEntry(FoodEntry entry) {
    return entry.product.barcode.startsWith('manual_');
  }
}
