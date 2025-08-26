import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary_history.dart';

class SugarConsumptionGraph extends HookConsumerWidget {
  const SugarConsumptionGraph({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPeriod = useState<GraphPeriod>(GraphPeriod.thisWeek);
    
    // Get historical data based on selected period
    final historicalDataAsync = _getHistoricalDataForPeriod(ref, selectedPeriod.value);
    
    return historicalDataAsync.when(
      data: (data) => Container(
      padding: const EdgeInsets.all(20.0),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with period selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sugar Consumption',
                style: AppTextStyles.title,
              ),
              _buildPeriodSelector(selectedPeriod),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Stats for the period
          _buildPeriodStats(selectedPeriod.value, data),
          
          const SizedBox(height: 24),
          
          // The graph
          SizedBox(
            height: 200,
            child: _buildGraph(selectedPeriod.value, data),
          ),
          
          const SizedBox(height: 16),
          
          // Month labels (like JUL, AUG in the reference)
          _buildTimeLabels(selectedPeriod.value),
        ],
      ),
      ),
      loading: () => Container(
        height: 300,
        padding: const EdgeInsets.all(20.0),
        decoration: AppCardStyles.primary,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(),
              SizedBox(height: 16),
              Text(
                'Loading your progress...',
                style: TextStyle(color: AppTheme.textSecondary),
              ),
            ],
          ),
        ),
      ),
      error: (error, _) => Container(
        height: 300,
        padding: const EdgeInsets.all(20.0),
        decoration: AppCardStyles.primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_triangle,
                color: AppTheme.accentOrange,
                size: 32,
              ),
              const SizedBox(height: 16),
              Text(
                'Unable to load progress data',
                style: AppTextStyles.body.copyWith(color: AppTheme.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodSelector(ValueNotifier<GraphPeriod> selectedPeriod) {
    return Row(
      children: [
        _buildPeriodTab(
          'Week',
          GraphPeriod.thisWeek,
          selectedPeriod.value == GraphPeriod.thisWeek,
          () => selectedPeriod.value = GraphPeriod.thisWeek,
        ),
        const SizedBox(width: 8),
        _buildPeriodTab(
          'Month',
          GraphPeriod.thisMonth,
          selectedPeriod.value == GraphPeriod.thisMonth,
          () => selectedPeriod.value = GraphPeriod.thisMonth,
        ),
      ],
    );
  }

  Widget _buildPeriodTab(
    String label,
    GraphPeriod period,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlack : AppTheme.surfaceBackground,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppTheme.borderDefault,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppTheme.primaryWhite : AppTheme.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodStats(GraphPeriod period, List<DailySummaryHistory> data) {
    final stats = _getStatsFromData(data);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem(
          'Average',
          '${(stats['average'] ?? 0.0).toStringAsFixed(1)}g',
          AppTheme.textPrimary,
        ),
        _buildStatItem(
          'Best Day',
          '${(stats['best'] ?? 0.0).toStringAsFixed(1)}g',
          AppTheme.progressGreen,
        ),
        _buildStatItem(
          'Daily Limit',
          '${(stats['limit'] ?? 25.0).toStringAsFixed(0)}g',
          AppTheme.accentOrange,
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
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
        ),
      ],
    );
  }

  Widget _buildGraph(GraphPeriod period, List<DailySummaryHistory> data) {
    final dataPoints = _getDataPointsFromHistory(data, period);
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppTheme.borderDefault,
          width: 1,
        ),
      ),
      child: CustomPaint(
        painter: SugarGraphPainter(
          dataPoints: dataPoints,
          maxValue: 40.0, // Max sugar consumption to show
          dailyLimit: 25.0,
        ),
        child: Container(),
      ),
    );
  }

  Widget _buildTimeLabels(GraphPeriod period) {
    final labels = period == GraphPeriod.thisWeek
        ? ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
        : ['WK1', 'WK2', 'WK3', 'WK4'];
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: labels.map((label) => Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppTheme.textMuted,
        ),
      )).toList(),
    );
  }

  // Helper method to get historical data for the selected period
  AsyncValue<List<DailySummaryHistory>> _getHistoricalDataForPeriod(
    WidgetRef ref,
    GraphPeriod period,
  ) {
    final now = DateTime.now();
    final String startDate;
    final String endDate = _formatDate(now);
    
    if (period == GraphPeriod.thisWeek) {
      // Get data for the past 7 days
      final weekStart = now.subtract(Duration(days: now.weekday - 1));
      startDate = _formatDate(weekStart);
      return ref.watch(dailySummariesInRangeProvider(startDate, endDate));
    } else {
      // Get data for the past 30 days (month)
      final monthStart = DateTime(now.year, now.month, 1);
      startDate = _formatDate(monthStart);
      return ref.watch(dailySummariesInRangeProvider(startDate, endDate));
    }
  }
  
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }


  // Get statistics from real historical data
  Map<String, double> _getStatsFromData(List<DailySummaryHistory> data) {
    if (data.isEmpty) {
      return {
        'average': 0.0,
        'best': 0.0,
        'limit': 25.0,
      };
    }

    final totalSugar = data.map((d) => d.totalSugar).fold(0.0, (a, b) => a + b);
    final average = totalSugar / data.length;
    final best = data.map((d) => d.totalSugar).reduce((a, b) => a < b ? a : b);
    final limit = data.isNotEmpty ? data.first.dailyLimit : 25.0;

    return {
      'average': average,
      'best': best,
      'limit': limit,
    };
  }

  // Convert historical data to graph data points
  List<double> _getDataPointsFromHistory(List<DailySummaryHistory> data, GraphPeriod period) {
    if (data.isEmpty) {
      // Return empty points for the expected period length
      return period == GraphPeriod.thisWeek 
          ? List.filled(7, 0.0) 
          : List.filled(30, 0.0);
    }

    // Sort data by date to ensure correct order
    final sortedData = [...data];
    sortedData.sort((a, b) => a.date.compareTo(b.date));

    if (period == GraphPeriod.thisWeek) {
      // For week view, fill 7 days with data, using 0 for missing days
      final points = <double>[];
      final now = DateTime.now();
      
      for (int i = 6; i >= 0; i--) {
        final targetDate = now.subtract(Duration(days: i));
        final targetDateString = _formatDate(targetDate);
        
        final dayData = sortedData.where((d) => d.date == targetDateString).firstOrNull;
        points.add(dayData?.totalSugar ?? 0.0);
      }
      
      return points;
    } else {
      // For month view, return daily data points
      return sortedData.map((d) => d.totalSugar).toList();
    }
  }

}

enum GraphPeriod {
  thisWeek,
  thisMonth,
}

class SugarGraphPainter extends CustomPainter {
  final List<double> dataPoints;
  final double maxValue;
  final double dailyLimit;

  SugarGraphPainter({
    required this.dataPoints,
    required this.maxValue,
    required this.dailyLimit,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (dataPoints.isEmpty) return;

    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..style = PaintingStyle.fill;

    // Draw limit line
    final limitY = size.height - (dailyLimit / maxValue * size.height);
    paint.color = AppTheme.accentOrange.withValues(alpha: 0.5);
    canvas.drawLine(
      Offset(0, limitY),
      Offset(size.width, limitY),
      paint..strokeWidth = 1,
    );

    // Calculate points
    final points = <Offset>[];
    for (int i = 0; i < dataPoints.length; i++) {
      final x = (i / (dataPoints.length - 1)) * size.width;
      final y = size.height - (dataPoints[i] / maxValue * size.height);
      points.add(Offset(x, y));
    }

    // Draw filled area under curve
    final path = Path();
    path.moveTo(0, size.height);
    for (final point in points) {
      path.lineTo(point.dx, point.dy);
    }
    path.lineTo(size.width, size.height);
    path.close();

    fillPaint.color = AppTheme.accentOrange.withValues(alpha: 0.2);
    canvas.drawPath(path, fillPaint);

    // Draw line connecting points
    if (points.length > 1) {
      final linePath = Path();
      linePath.moveTo(points[0].dx, points[0].dy);
      for (int i = 1; i < points.length; i++) {
        linePath.lineTo(points[i].dx, points[i].dy);
      }

      paint.color = AppTheme.accentOrange;
      paint.strokeWidth = 3;
      canvas.drawPath(linePath, paint);
    }

    // Draw dots on data points
    for (final point in points) {
      canvas.drawCircle(
        point,
        4,
        Paint()
          ..color = AppTheme.accentOrange
          ..style = PaintingStyle.fill,
      );
      
      // White border on dots
      canvas.drawCircle(
        point,
        4,
        Paint()
          ..color = AppTheme.primaryWhite
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}