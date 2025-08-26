import 'package:quit_suggar/features/tracking/domain/entities/daily_summary_history.dart';
import 'package:quit_suggar/features/tracking/domain/repositories/historical_data_repository.dart';
import 'package:quit_suggar/features/tracking/data/datasources/historical_data_service.dart';

class HistoricalDataRepositoryImpl implements HistoricalDataRepository {
  final HistoricalDataService _dataService;

  HistoricalDataRepositoryImpl(this._dataService);

  @override
  Future<void> saveDailySummary(DailySummaryHistory summary) async {
    await _dataService.saveDailySummary(summary);
  }

  @override
  Future<DailySummaryHistory?> getDailySummary(String date) async {
    return await _dataService.getDailySummary(date);
  }

  @override
  Future<List<DailySummaryHistory>> getDailySummariesInRange({
    required String startDate,
    required String endDate,
  }) async {
    return await _dataService.getDailySummariesInRange(
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  Future<List<DailySummaryHistory>> getRecentDailySummaries(int count) async {
    return await _dataService.getRecentDailySummaries(count);
  }

  @override
  Future<List<String>> getAvailableDates() async {
    return await _dataService.getAvailableDates();
  }

  @override
  Future<void> deleteDailySummary(String date) async {
    await _dataService.deleteDailySummary(date);
  }

  @override
  Future<void> clearAllHistory() async {
    await _dataService.clearAllHistory();
  }

  @override
  Future<Map<String, dynamic>> getHistoricalStats() async {
    return await _dataService.getHistoricalStats();
  }
}