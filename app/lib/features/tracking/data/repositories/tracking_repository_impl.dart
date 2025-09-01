import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/features/tracking/domain/repositories/tracking_repository.dart';
import 'package:quit_suggar/features/tracking/data/datasources/tracking_storage_service.dart';
import 'package:quit_suggar/features/tracking/data/datasources/openfoodfacts_api_service.dart';

class TrackingRepositoryImpl implements TrackingRepository {
  final TrackingStorageService _storageService;
  final OpenFoodFactsApiService _apiService;

  TrackingRepositoryImpl(
    this._storageService, 
    this._apiService,
  );

  // Storage operations
  @override
  Future<double> getDailyLimit() async {
    // Get the stored daily limit from tracking storage
    // The daily limit sync service will handle updating this value
    return await _storageService.loadDailyLimit(25.0);
  }

  @override
  Future<void> setDailyLimit(double limit) async {
    await _storageService.saveDailyLimit(limit);
  }

  @override
  Future<double> getCurrentSugarIntake() async {
    return await _storageService.loadSugarIntake();
  }

  @override
  Future<void> saveCurrentSugarIntake(double intake) async {
    await _storageService.saveSugarIntake(intake);
  }

  @override
  Future<List<FoodEntry>> getTodayEntries() async {
    return await _storageService.loadTodayEntries();
  }

  @override
  Future<void> saveTodayEntries(List<FoodEntry> entries) async {
    await _storageService.saveTodayEntries(entries);
  }

  @override
  Future<int> getCurrentStreak() async {
    return await _storageService.loadStreak();
  }

  @override
  Future<void> saveCurrentStreak(int streak) async {
    await _storageService.saveStreak(streak);
  }

  @override
  Future<String?> getLastStreakDate() async {
    return await _storageService.loadLastStreakDate();
  }

  @override
  Future<void> saveLastStreakDate(String date) async {
    await _storageService.saveLastStreakDate(date);
  }

  @override
  Future<void> removeLastStreakDate() async {
    await _storageService.removeLastStreakDate();
  }

  @override
  Future<String?> getLastTrackingDate() async {
    return await _storageService.loadLastDate();
  }

  @override
  Future<void> saveLastTrackingDate(String date) async {
    await _storageService.saveLastDate(date);
  }

  @override
  Future<void> saveAllTrackingData({
    required String date,
    required double dailyLimit,
    required double sugarIntake,
    required List<FoodEntry> entries,
    required int streak,
  }) async {
    await _storageService.saveAllTrackingData(
      date: date,
      dailyLimit: dailyLimit,
      sugarIntake: sugarIntake,
      entries: entries,
      streak: streak,
    );
  }

  @override
  Future<void> clearAllData() async {
    await _storageService.clearAllData();
  }

  // API operations
  @override
  Future<ProductInfo?> getProductByBarcode(String barcode) async {
    return await _apiService.getProductByBarcode(barcode);
  }

  @override
  Future<List<ProductInfo>> searchProducts(String query) async {
    return await _apiService.searchProducts(query);
  }
}
