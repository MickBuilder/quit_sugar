import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/program/domain/entities/progress_overview.dart';
import 'package:quit_suggar/features/program/domain/repositories/progress_repository.dart';
import 'package:quit_suggar/features/program/data/repositories/progress_repository_impl.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/features/tracking/domain/repositories/historical_data_repository.dart';
import 'package:quit_suggar/features/tracking/data/repositories/historical_data_repository_impl.dart';


part 'progress_providers.g.dart';

// Historical data repository provider
@riverpod
HistoricalDataRepository historicalDataRepository(Ref ref) {
  final dataService = ref.watch(historicalDataServiceProvider);
  return HistoricalDataRepositoryImpl(dataService);
}

// Progress repository provider
@riverpod
ProgressRepository progressRepository(Ref ref) {
  final trackingRepository = ref.watch(trackingRepositoryProvider);
  final historicalDataRepository = ref.watch(historicalDataRepositoryProvider);
  return ProgressRepositoryImpl(trackingRepository, historicalDataRepository);
}

// Progress overview provider
@riverpod
Future<ProgressOverview> progressOverview(Ref ref) async {
  final repository = ref.watch(progressRepositoryProvider);
  return await repository.getProgressOverview();
}

// Weekly progress provider
@riverpod
Future<List<WeeklyProgress>> weeklyProgress(Ref ref, {int weeks = 8}) async {
  final repository = ref.watch(progressRepositoryProvider);
  return await repository.getWeeklyProgress(weeks: weeks);
}

// Monthly stats provider
@riverpod
Future<Map<String, int>> monthlyStats(Ref ref) async {
  final repository = ref.watch(progressRepositoryProvider);
  return await repository.getMonthlyStats();
}

// Total sugar saved provider
@riverpod
Future<double> totalSugarSaved(Ref ref) async {
  final repository = ref.watch(progressRepositoryProvider);
  return await repository.getTotalSugarSaved();
}
