import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'today_entries_list.dart';

class FoodLogCard extends StatelessWidget {
  final List<FoodEntry> entries;

  const FoodLogCard({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppCardStyles.primary,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Today\'s Food Log', style: AppTextStyles.heading),
          const SizedBox(height: 16),
          TodayEntriesList(entries: entries),
        ],
      ),
    );
  }
}
