import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/core/services/sugar_tracking_service.dart';

class SimpleProgressGrid extends StatelessWidget {
  final SugarTrackingService service;

  const SimpleProgressGrid({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CardStyles.primary,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Last 7 Days',
            style: EmotionalTextStyles.motivational,
          ),
          const SizedBox(height: 16),
          
          // Simple 7-day grid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              final dayData = _getDayData(index);
              return Column(
                children: [
                  Text(
                    dayData['day'],
                    style: EmotionalTextStyles.supportive.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: dayData['color'],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppTheme.borderDefault,
                        width: 1,
                      ),
                    ),
                    child: dayData['isToday'] 
                      ? Center(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryWhite,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        )
                      : null,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dayData['value'],
                    style: EmotionalTextStyles.caption.copyWith(
                      fontSize: 10,
                      color: AppTheme.textMuted,
                    ),
                  ),
                ],
              );
            }),
          ),
          
          const SizedBox(height: 16),
          
          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem('Good', AppTheme.accentGreen),
              const SizedBox(width: 16),
              _buildLegendItem('Over', AppTheme.accentOrange),
              const SizedBox(width: 16),
              _buildLegendItem('No data', AppTheme.accentGrey),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: EmotionalTextStyles.caption.copyWith(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
  
  Map<String, dynamic> _getDayData(int dayIndex) {
    final isToday = dayIndex == 6;
    
    // Mock data for demonstration
    final mockSugar = _getMockSugarData(dayIndex);
    
    return {
      'day': ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][dayIndex],
      'color': mockSugar == 0 
        ? AppTheme.accentGrey
        : mockSugar <= 25 
          ? AppTheme.accentGreen
          : AppTheme.accentOrange,
      'value': mockSugar == 0 ? '-' : '${mockSugar.toInt()}g',
      'isToday': isToday,
    };
  }
  
  double _getMockSugarData(int dayIndex) {
    // Mock data - in real app, get from service
    final mockData = [22.5, 18.0, 28.3, 15.2, 0.0, 24.1, 19.8];
    return dayIndex < mockData.length ? mockData[dayIndex] : 0.0;
  }
}
