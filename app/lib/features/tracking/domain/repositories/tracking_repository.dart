import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';

abstract class TrackingRepository {
  // Storage operations
  Future<double> getDailyLimit();
  Future<void> setDailyLimit(double limit);

  Future<double> getCurrentSugarIntake();
  Future<void> saveCurrentSugarIntake(double intake);

  Future<List<FoodEntry>> getTodayEntries();
  Future<void> saveTodayEntries(List<FoodEntry> entries);

  Future<int> getCurrentStreak();
  Future<void> saveCurrentStreak(int streak);

  Future<String?> getLastStreakDate();
  Future<void> saveLastStreakDate(String date);
  Future<void> removeLastStreakDate();

  Future<String?> getLastTrackingDate();
  Future<void> saveLastTrackingDate(String date);

  Future<void> saveAllTrackingData({
    required String date,
    required double dailyLimit,
    required double sugarIntake,
    required List<FoodEntry> entries,
    required int streak,
  });

  Future<void> clearAllData();

  // API operations
  Future<ProductInfo?> getProductByBarcode(String barcode);
  Future<List<ProductInfo>> searchProducts(String query);
}
