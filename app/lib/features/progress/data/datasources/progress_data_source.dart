abstract class ProgressDataSource {
  Future<Map<String, dynamic>> getHistoricalData();
  Future<List<Map<String, dynamic>>> getWeeklyData({int weeks = 8});
  Future<Map<String, int>> getMonthlyStatistics();
  Future<void> saveProgressMetrics(Map<String, dynamic> metrics);
}