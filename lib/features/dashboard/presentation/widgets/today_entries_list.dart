import 'package:flutter/material.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/dashboard/presentation/widgets/food_entry_item.dart';

class TodayEntriesList extends StatelessWidget {
  final List<FoodEntry> entries;

  const TodayEntriesList({
    super.key,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    AppLogger.logUI('Building today entries section with ${entries.length} entries');
    
    if (entries.isEmpty) {
      return Container(
        decoration: CardStyles.primary,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Food Log:',
              style: EmotionalTextStyles.motivational.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'No items tracked yet. Start by scanning a product!',
              style: EmotionalTextStyles.supportive,
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: CardStyles.primary,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Food Log:',
            style: EmotionalTextStyles.motivational.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 12),
          ...entries.map((entry) => FoodEntryItem(entry: entry)),
        ],
      ),
    );
  }
}