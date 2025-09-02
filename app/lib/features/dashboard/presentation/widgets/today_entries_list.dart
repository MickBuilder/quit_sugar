import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/food_entry_item.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/delete_confirmation_dialog.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';

class TodayEntriesList extends ConsumerWidget {
  final List<FoodEntry> entries;

  const TodayEntriesList({super.key, required this.entries});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLogger.logUI(
      'Building today entries section with ${entries.length} entries',
    );

    if (entries.isEmpty) {
      return Container(
        decoration: AppCardStyles.primary,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Food Log:',
              style: AppTextStyles.heading.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'No items tracked yet. Start by scanning a product!',
              style: AppTextStyles.body,
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: AppCardStyles.primary,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Food Log:',
            style: AppTextStyles.heading.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 12),
          ...entries.map((entry) => FoodEntryItem(
            entry: entry,
            onEdit: () => _handleEdit(context, ref, entry),
            onDelete: () => _handleDelete(context, ref, entry),
          )),
        ],
      ),
    );
  }

  void _handleEdit(BuildContext context, WidgetRef ref, FoodEntry entry) {
    if (_isManualEntry(entry)) {
      // For manual entries, navigate to manual entry screen with pre-filled data
      context.push('/manual-entry', extra: {
        'foodName': entry.displayName,
        'sugarAmount': entry.sugarAmount,
        'entryId': entry.id,
      });
    } else {
      // For scanned products, navigate to edit scanned product screen
      context.push('/edit-scanned-product', extra: entry);
    }
  }

  bool _isManualEntry(FoodEntry entry) {
    return entry.product.barcode.startsWith('manual_');
  }

  void _handleDelete(BuildContext context, WidgetRef ref, FoodEntry entry) {
    showCupertinoDialog(
      context: context,
      builder: (context) => DeleteConfirmationDialog(
        entry: entry,
        onConfirm: () async {
          final success = await ref.read(sugarTrackingProvider.notifier).removeEntry(entry.id);
          
          if (success && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Entry deleted successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to delete entry'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
