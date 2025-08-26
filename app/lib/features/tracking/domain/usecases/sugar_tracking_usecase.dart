import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/features/tracking/domain/entities/daily_summary.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_status.dart';
import 'package:quit_suggar/features/tracking/domain/repositories/tracking_repository.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

class SugarTrackingUsecase {
  static const double _defaultDailyLimit = 25.0; // WHO recommended limit

  final TrackingRepository _repository;

  double _dailyLimit = _defaultDailyLimit;
  double _currentSugarIntake = 0.0;
  final List<FoodEntry> _todayEntries = [];
  int _currentStreak = 0;
  bool _isInitialized = false;

  SugarTrackingUsecase(this._repository);

  // Getters
  double get dailyLimit => _dailyLimit;
  double get currentSugarIntake => _currentSugarIntake;
  List<FoodEntry> get todayEntries => List.unmodifiable(_todayEntries);
  double get remainingSugar =>
      (_dailyLimit - _currentSugarIntake).clamp(0.0, double.infinity);
  double get progressPercentage =>
      (_currentSugarIntake / _dailyLimit).clamp(0.0, 1.0);
  int get currentStreak => _currentStreak;
  bool get isInitialized => _isInitialized;

  /// Initialize usecase by loading data from repository
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      AppLogger.logState('Initializing SugarTrackingUsecase from repository');
      await _loadFromRepository();
      _isInitialized = true;
      AppLogger.logState('SugarTrackingUsecase initialized successfully');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to initialize SugarTrackingUsecase',
        e,
        stackTrace,
      );
      _isInitialized = true; // Still mark as initialized to prevent retry loops
    }
  }

  /// Load data from repository
  Future<void> _loadFromRepository() async {
    // Check if we need to reset for a new day
    final lastDate = await _repository.getLastTrackingDate();
    final today = DateTime.now().toIso8601String().split(
      'T',
    )[0]; // YYYY-MM-DD format

    if (lastDate != today) {
      AppLogger.logState('New day detected, resetting daily tracking');
      await _resetForNewDay(today);
      return;
    }

    // Load existing data
    _dailyLimit = await _repository.getDailyLimit();
    _currentSugarIntake = await _repository.getCurrentSugarIntake();
    _currentStreak = await _repository.getCurrentStreak();

    // Load entries
    final entries = await _repository.getTodayEntries();
    _todayEntries.clear();
    _todayEntries.addAll(entries);

    AppLogger.logState(
      'Loaded from repository: ${_currentSugarIntake.toStringAsFixed(1)}g sugar, ${_todayEntries.length} entries',
    );
  }

  /// Save current state to repository
  Future<void> _saveToRepository() async {
    final today = DateTime.now().toIso8601String().split('T')[0];

    await _repository.saveAllTrackingData(
      date: today,
      dailyLimit: _dailyLimit,
      sugarIntake: _currentSugarIntake,
      entries: _todayEntries,
      streak: _currentStreak,
    );
  }

  /// Reset data for a new day
  Future<void> _resetForNewDay(String today) async {
    // Load current streak from repository, starts at 0
    _currentStreak = await _repository.getCurrentStreak();

    // Check if streak needs to be reset due to missing days
    final lastStreakDate = await _repository.getLastStreakDate();
    final yesterday = DateTime.now()
        .subtract(const Duration(days: 1))
        .toIso8601String()
        .split('T')[0];

    if (lastStreakDate != null &&
        lastStreakDate != yesterday &&
        _currentStreak > 0) {
      // Streak was broken due to missing day(s)
      _currentStreak = 0;
      AppLogger.logSugarTracking('Streak broken: missed a day');
    } else {
      AppLogger.logSugarTracking('Current streak: $_currentStreak days');
    }

    _currentSugarIntake = 0.0;
    _todayEntries.clear();

    await _repository.saveAllTrackingData(
      date: today,
      dailyLimit: _dailyLimit,
      sugarIntake: 0.0,
      entries: [],
      streak: _currentStreak,
    );
  }

  /// Evaluate and update daily streak at end of day
  Future<bool> _evaluateDailyStreak() async {
    final today = DateTime.now().toIso8601String().split('T')[0];
    final lastStreakDate = await _repository.getLastStreakDate();

    // Only evaluate if we haven't already evaluated today
    if (lastStreakDate == today) {
      return false; // Already evaluated for today, no changes made
    }

    final oldStreak = _currentStreak;

    // STREAK RULE: User gets a streak point ONLY if they stay within daily limit
    if (_currentSugarIntake <= _dailyLimit) {
      // SUCCESS: Under or at limit - achieved daily goal, increment streak
      _currentStreak++;

      // Mark today as a successful day
      await _repository.saveLastStreakDate(today);
      await _repository.saveCurrentStreak(_currentStreak);

      AppLogger.logSugarTracking(
        'Daily goal achieved! Streak: $_currentStreak days (stayed under ${_dailyLimit.toStringAsFixed(0)}g limit with ${_currentSugarIntake.toStringAsFixed(1)}g)',
      );
    } else {
      // FAILURE: Over limit - goal not achieved, RESET STREAK TO 0
      _currentStreak = 0;
      await _repository.saveCurrentStreak(0);
      await _repository.removeLastStreakDate();

      AppLogger.logSugarTracking(
        'Daily goal FAILED: ${_currentSugarIntake.toStringAsFixed(1)}g exceeds ${_dailyLimit.toStringAsFixed(0)}g limit - STREAK RESET TO 0',
      );
    }

    // Always save the updated streak
    await _saveToRepository();

    return _currentStreak != oldStreak; // Return true if streak changed
  }

  /// Handle immediate streak reset when user exceeds daily limit
  Future<void> _handleLimitExceeded(double oldIntake, double newIntake) async {
    // If user was under limit but now exceeds it, reset streak immediately
    if (oldIntake <= _dailyLimit && newIntake > _dailyLimit && _currentStreak > 0) {
      final oldStreak = _currentStreak;
      _currentStreak = 0;
      
      await _repository.saveCurrentStreak(0);
      await _repository.removeLastStreakDate();

      AppLogger.logSugarTracking(
        'LIMIT EXCEEDED! Daily limit of ${_dailyLimit.toStringAsFixed(0)}g exceeded with ${newIntake.toStringAsFixed(1)}g - Streak reset from $oldStreak to 0 immediately',
      );
    }
  }

  /// Check if we should evaluate daily streak (called when user opens app)
  Future<bool> checkDailyStreakEvaluation() async {
    return await _evaluateDailyStreak();
  }

  /// Get product by barcode
  Future<ProductInfo?> getProductByBarcode(String barcode) async {
    return await _repository.getProductByBarcode(barcode);
  }

  /// Search products by name
  Future<List<ProductInfo>> searchProducts(String query) async {
    return await _repository.searchProducts(query);
  }

  /// Add a food entry to today's tracking
  Future<bool> addFoodEntry(
    ProductInfo product,
    double portionGrams, {
    String? customName,
  }) async {
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
      final oldSugarIntake = _currentSugarIntake;
      _currentSugarIntake += sugarAmount;

      // Check if user exceeded limit with this entry
      await _handleLimitExceeded(oldSugarIntake, _currentSugarIntake);

      // Save to repository
      await _saveToRepository();

      AppLogger.logSugarTracking(
        'Added food entry: ${entry.displayName} - ${sugarAmount.toStringAsFixed(1)}g sugar (${portionGrams}g portion)',
      );
      AppLogger.logSugarTracking(
        'Daily total updated: ${_currentSugarIntake.toStringAsFixed(1)}g / ${_dailyLimit.toStringAsFixed(0)}g',
      );

      return true;
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Error adding food entry', e, stackTrace);
      return false;
    }
  }

  /// Add a manual food entry (for foods not in database)
  Future<bool> addManualEntry(
    String foodName,
    double sugarAmount, {
    double? portionGrams,
  }) async {
    try {
      final product = ProductInfo(
        barcode: 'manual_${DateTime.now().millisecondsSinceEpoch}',
        name: foodName,
        sugarPer100g: portionGrams != null
            ? (sugarAmount * 100 / portionGrams)
            : null,
      );

      AppLogger.logSugarTracking(
        'Adding manual entry: $foodName - ${sugarAmount.toStringAsFixed(1)}g sugar',
      );

      return await addFoodEntry(
        product,
        portionGrams ?? 100.0,
        customName: foodName,
      );
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Error adding manual entry: $foodName',
        e,
        stackTrace,
      );
      return false;
    }
  }

  /// Remove a food entry
  Future<bool> removeEntry(String entryId) async {
    final index = _todayEntries.indexWhere((entry) => entry.id == entryId);
    if (index != -1) {
      final entry = _todayEntries[index];
      _currentSugarIntake -= entry.sugarAmount;
      _todayEntries.removeAt(index);

      // Save to repository
      await _saveToRepository();

      AppLogger.logSugarTracking(
        'Removed food entry: ${entry.displayName} - ${entry.sugarAmount.toStringAsFixed(1)}g sugar',
      );
      AppLogger.logSugarTracking(
        'Daily total updated: ${_currentSugarIntake.toStringAsFixed(1)}g / ${_dailyLimit.toStringAsFixed(0)}g',
      );

      return true;
    }

    AppLogger.logSugarTracking(
      'Failed to remove entry: Entry with ID $entryId not found',
    );
    return false;
  }

  /// Set daily sugar limit
  Future<void> setDailyLimit(double limit) async {
    final oldLimit = _dailyLimit;
    _dailyLimit = limit.clamp(0.0, double.infinity);

    // Save to repository
    await _saveToRepository();

    AppLogger.logSugarTracking(
      'Daily limit changed: ${oldLimit.toStringAsFixed(0)}g → ${_dailyLimit.toStringAsFixed(0)}g',
    );
  }

  /// Reset today's tracking
  Future<void> resetToday() async {
    final oldTotal = _currentSugarIntake;
    final oldEntriesCount = _todayEntries.length;

    _currentSugarIntake = 0.0;
    _todayEntries.clear();

    // Save to repository
    await _saveToRepository();

    AppLogger.logSugarTracking(
      'Reset daily tracking: $oldEntriesCount entries, ${oldTotal.toStringAsFixed(1)}g sugar cleared',
    );
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
      streak: _currentStreak,
    );

    AppLogger.logSugarTracking(
      'Daily summary: ${summary.totalSugar.toStringAsFixed(1)}g/${summary.dailyLimit.toStringAsFixed(0)}g '
      '(${(summary.progressPercentage * 100).toStringAsFixed(0)}%) - Status: ${summary.status.name}',
    );

    return summary;
  }
}
