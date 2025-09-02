import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/food_entry_item.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/edit_food_entry_dialog.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/delete_confirmation_dialog.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';

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
    showCupertinoDialog(
      context: context,
      builder: (context) => EditFoodEntryDialog(
        entry: entry,
        onSave: (portionGrams, sugarAmount) async {
          final success = await ref.read(sugarTrackingProvider.notifier).editEntry(
            entry.id,
            portionGrams: portionGrams,
            sugarAmount: sugarAmount,
          );
          
          if (success && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Entry updated successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to update entry'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
    );
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
