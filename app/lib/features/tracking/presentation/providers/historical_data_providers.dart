import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_log.dart';
import 'package:quit_suggar/features/tracking/domain/repositories/historical_data_repository.dart';
import 'package:quit_suggar/features/tracking/data/repositories/historical_data_repository_impl.dart';
import 'package:quit_suggar/features/tracking/data/datasources/historical_data_service.dart';

part 'historical_data_providers.g.dart';

// Historical data providers
@riverpod
HistoricalDataService historicalDataService(Ref ref) {
  return HistoricalDataService();
}

@riverpod
HistoricalDataRepository historicalDataRepository(Ref ref) {
  final dataService = ref.watch(historicalDataServiceProvider);
  return HistoricalDataRepositoryImpl(dataService);
}

// Historical data queries
@riverpod
Future<List<DailyLog>> recentDailySummaries(
  Ref ref,
  int count,
) async {
  final repository = ref.watch(historicalDataRepositoryProvider);
  return await repository.getRecentDailySummaries(count);
}

@riverpod
Future<List<DailyLog>> dailySummariesInRange(
  Ref ref,
  String startDate,
  String endDate,
) async {
  final repository = ref.watch(historicalDataRepositoryProvider);
  return await repository.getDailySummariesInRange(
    startDate: startDate,
    endDate: endDate,
  );
}

@riverpod
Future<Map<String, dynamic>> historicalStats(Ref ref) async {
  final repository = ref.watch(historicalDataRepositoryProvider);
  return await repository.getHistoricalStats();
}
