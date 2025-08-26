abstract class DashboardDataSource {
  Future<Map<String, dynamic>> getDashboardData();
  Future<String> getMotivationalQuote();
  Future<void> cacheDashboardData(Map<String, dynamic> data);
}