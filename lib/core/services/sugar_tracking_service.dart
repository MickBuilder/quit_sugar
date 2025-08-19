import 'package:quit_suggar/core/services/openfoodfacts_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

class SugarTrackingService {
  static const double _defaultDailyLimit = 25.0; // WHO recommended limit
  
  double _dailyLimit = _defaultDailyLimit;
  double _currentSugarIntake = 0.0;
  final List<FoodEntry> _todayEntries = [];
  
  // Getters
  double get dailyLimit => _dailyLimit;
  double get currentSugarIntake => _currentSugarIntake;
  List<FoodEntry> get todayEntries => List.unmodifiable(_todayEntries);
  double get remainingSugar => (_dailyLimit - _currentSugarIntake).clamp(0.0, double.infinity);
  double get progressPercentage => (_currentSugarIntake / _dailyLimit).clamp(0.0, 1.0);
  
  /// Add a food entry to today's tracking
  Future<bool> addFoodEntry(ProductInfo product, double portionGrams, {String? customName}) async {
    try {
      final sugarAmount = product.calculateSugarForPortion(portionGrams);
      
      final entry = FoodEntry(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        product: product,
        portionGrams: portionGrams,
        sugarAmount: sugarAmount,
        customName: customName,
        timestamp: DateTime.now(),
      );
      
      _todayEntries.add(entry);
      _currentSugarIntake += sugarAmount;
      
      AppLogger.logSugarTracking(
        'Added food entry: ${entry.displayName} - ${sugarAmount.toStringAsFixed(1)}g sugar (${portionGrams}g portion)'
      );
      AppLogger.logSugarTracking('Daily total updated: ${_currentSugarIntake.toStringAsFixed(1)}g / ${_dailyLimit.toStringAsFixed(0)}g');
      
      return true;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Error adding food entry', e, stackTrace);
      return false;
    }
  }
  
  /// Add a manual food entry (for foods not in database)
  Future<bool> addManualEntry(String foodName, double sugarAmount, {double? portionGrams}) async {
    try {
      final product = ProductInfo(
        barcode: 'manual_${DateTime.now().millisecondsSinceEpoch}',
        name: foodName,
        sugarPer100g: portionGrams != null ? (sugarAmount * 100 / portionGrams) : null,
      );
      
      AppLogger.logSugarTracking('Adding manual entry: $foodName - ${sugarAmount.toStringAsFixed(1)}g sugar');
      
      return await addFoodEntry(product, portionGrams ?? 100.0, customName: foodName);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Error adding manual entry: $foodName', e, stackTrace);
      return false;
    }
  }
  
  /// Remove a food entry
  bool removeEntry(String entryId) {
    final index = _todayEntries.indexWhere((entry) => entry.id == entryId);
    if (index != -1) {
      final entry = _todayEntries[index];
      _currentSugarIntake -= entry.sugarAmount;
      _todayEntries.removeAt(index);
      
      AppLogger.logSugarTracking(
        'Removed food entry: ${entry.displayName} - ${entry.sugarAmount.toStringAsFixed(1)}g sugar'
      );
      AppLogger.logSugarTracking('Daily total updated: ${_currentSugarIntake.toStringAsFixed(1)}g / ${_dailyLimit.toStringAsFixed(0)}g');
      
      return true;
    }
    
    AppLogger.logSugarTracking('Failed to remove entry: Entry with ID $entryId not found');
    return false;
  }
  
  /// Set daily sugar limit
  void setDailyLimit(double limit) {
    final oldLimit = _dailyLimit;
    _dailyLimit = limit.clamp(0.0, double.infinity);
    
    AppLogger.logSugarTracking('Daily limit changed: ${oldLimit.toStringAsFixed(0)}g → ${_dailyLimit.toStringAsFixed(0)}g');
  }
  
  /// Reset today's tracking
  void resetToday() {
    final oldTotal = _currentSugarIntake;
    final oldEntriesCount = _todayEntries.length;
    
    _currentSugarIntake = 0.0;
    _todayEntries.clear();
    
    AppLogger.logSugarTracking('Reset daily tracking: $oldEntriesCount entries, ${oldTotal.toStringAsFixed(1)}g sugar cleared');
  }
  
  /// Get sugar status (green/yellow/red zone)
  SugarStatus getSugarStatus() {
    final percentage = progressPercentage;
    
    if (percentage <= 0.7) {
      return SugarStatus.green;
    } else if (percentage <= 0.9) {
      return SugarStatus.yellow;
    } else if (percentage <= 1.0) {
      return SugarStatus.red;
    } else {
      return SugarStatus.overLimit;
    }
  }
  
  /// Get motivational message based on current status
  String getMotivationalMessage() {
    final status = getSugarStatus();
    final remaining = remainingSugar;
    
    switch (status) {
      case SugarStatus.green:
        if (remaining > 15) {
          return "Excellent! You're well under your limit. Keep it up!";
        } else {
          return "Great job! You're staying within your healthy range.";
        }
      case SugarStatus.yellow:
        return "Be careful! You're approaching your daily limit.";
      case SugarStatus.red:
        return "Warning! You're very close to your daily limit.";
      case SugarStatus.overLimit:
        return "You've exceeded your limit today. Tomorrow is a new day!";
    }
  }
  
  /// Get daily summary
  DailySummary getDailySummary() {
    final summary = DailySummary(
      totalSugar: _currentSugarIntake,
      dailyLimit: _dailyLimit,
      remainingSugar: remainingSugar,
      progressPercentage: progressPercentage,
      status: getSugarStatus(),
      entries: todayEntries,
      motivationalMessage: getMotivationalMessage(),
    );
    
    AppLogger.logSugarTracking(
      'Daily summary: ${summary.totalSugar.toStringAsFixed(1)}g/${summary.dailyLimit.toStringAsFixed(0)}g '
      '(${(summary.progressPercentage * 100).toStringAsFixed(0)}%) - Status: ${summary.status.name}'
    );
    
    return summary;
  }
}

class FoodEntry {
  final String id;
  final ProductInfo product;
  final double portionGrams;
  final double sugarAmount;
  final String? customName;
  final DateTime timestamp;
  
  FoodEntry({
    required this.id,
    required this.product,
    required this.portionGrams,
    required this.sugarAmount,
    this.customName,
    required this.timestamp,
  });
  
  String get displayName => customName ?? product.name;
  
  @override
  String toString() {
    return 'FoodEntry($displayName: ${sugarAmount.toStringAsFixed(1)}g sugar)';
  }
}

enum SugarStatus {
  green,    // 0-70% of limit
  yellow,   // 70-90% of limit
  red,      // 90-100% of limit
  overLimit // >100% of limit
}

class DailySummary {
  final double totalSugar;
  final double dailyLimit;
  final double remainingSugar;
  final double progressPercentage;
  final SugarStatus status;
  final List<FoodEntry> entries;
  final String motivationalMessage;
  
  DailySummary({
    required this.totalSugar,
    required this.dailyLimit,
    required this.remainingSugar,
    required this.progressPercentage,
    required this.status,
    required this.entries,
    required this.motivationalMessage,
  });
  
  bool get isUnderLimit => totalSugar <= dailyLimit;
  bool get isOverLimit => totalSugar > dailyLimit;
  bool get isCloseToLimit => progressPercentage > 0.8;
}
