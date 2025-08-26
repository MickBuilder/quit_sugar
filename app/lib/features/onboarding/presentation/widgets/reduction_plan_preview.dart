import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class ReductionPlanPreview extends StatelessWidget {
  final double currentSugar;
  final double targetSugar;
  final int days;

  const ReductionPlanPreview({
    super.key,
    required this.currentSugar,
    required this.targetSugar,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    final dailyReduction = (currentSugar - targetSugar) / days;
    final milestones = _calculateMilestones();
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your 60-Day Reduction Plan',
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _PlanStat(
                label: 'Daily Reduction',
                value: '${dailyReduction.toStringAsFixed(1)}g',
                color: AppTheme.accentOrange,
              ),
              _PlanStat(
                label: 'Total Reduction',
                value: '${(currentSugar - targetSugar).toStringAsFixed(1)}g',
                color: AppTheme.progressGreen,
              ),
              _PlanStat(
                label: 'Timeline',
                value: '$days days',
                color: AppTheme.accentBlue,
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          Text(
            'Key Milestones',
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          
          const SizedBox(height: 12),
          
          ...milestones.map((milestone) => _MilestoneItem(milestone: milestone)),
        ],
      ),
    );
  }

  List<String> _calculateMilestones() {
    final quarter = days ~/ 4;
    final half = days ~/ 2;
    final threeQuarter = (days * 0.75).round();
    
    final quarterSugar = currentSugar - ((currentSugar - targetSugar) * 0.25);
    final halfSugar = currentSugar - ((currentSugar - targetSugar) * 0.5);
    final threeQuarterSugar = currentSugar - ((currentSugar - targetSugar) * 0.75);
    
    return [
      'Day $quarter: ${quarterSugar.toStringAsFixed(1)}g daily limit',
      'Day $half: ${halfSugar.toStringAsFixed(1)}g daily limit',
      'Day $threeQuarter: ${threeQuarterSugar.toStringAsFixed(1)}g daily limit',
      'Day $days: ${targetSugar.toStringAsFixed(1)}g target reached!',
    ];
  }
}

class _PlanStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _PlanStat({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppTheme.textMuted,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _MilestoneItem extends StatelessWidget {
  final String milestone;

  const _MilestoneItem({required this.milestone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppTheme.accentOrange,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              milestone,
              style: AppTextStyles.body.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}