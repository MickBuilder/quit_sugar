import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quit_suggar/core/services/openfoodfacts_service.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

class SugarTrackingService {
  static const double _defaultDailyLimit = 25.0; // WHO recommended limit
  static const String _prefsKeyDailyLimit = 'daily_limit';
  static const String _prefsKeySugarIntake = 'current_sugar_intake';
  static const String _prefsKeyEntries = 'today_entries';
  static const String _prefsKeyLastDate = 'last_date';
  static const String _prefsKeyStreak = 'daily_streak';
  static const String _prefsKeyLastStreakDate = 'last_streak_date';
  
  double _dailyLimit = _defaultDailyLimit;
  double _currentSugarIntake = 0.0;
  final List<FoodEntry> _todayEntries = [];
  int _currentStreak = 0;
  bool _isInitialized = false;
  
  // Getters
  double get dailyLimit => _dailyLimit;
  double get currentSugarIntake => _currentSugarIntake;
  List<FoodEntry> get todayEntries => List.unmodifiable(_todayEntries);
  double get remainingSugar => (_dailyLimit - _currentSugarIntake).clamp(0.0, double.infinity);
  double get progressPercentage => (_currentSugarIntake / _dailyLimit).clamp(0.0, 1.0);
  int get currentStreak => _currentStreak;
  bool get isInitialized => _isInitialized;
  
  /// Initialize service by loading data from persistent storage
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      AppLogger.logState('Initializing SugarTrackingService from storage');
      await _loadFromStorage();
      _isInitialized = true;
      AppLogger.logState('SugarTrackingService initialized successfully');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to initialize SugarTrackingService', e, stackTrace);
      _isInitialized = true; // Still mark as initialized to prevent retry loops
    }
  }
  
  /// Load data from SharedPreferences
  Future<void> _loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Check if we need to reset for a new day
    final lastDateString = prefs.getString(_prefsKeyLastDate);
    final today = DateTime.now().toIso8601String().split('T')[0]; // YYYY-MM-DD format
    
    if (lastDateString != today) {
      AppLogger.logState('New day detected, resetting daily tracking');
      await _resetForNewDay(prefs, today);
      return;
    }
    
    // Load existing data
    _dailyLimit = prefs.getDouble(_prefsKeyDailyLimit) ?? _defaultDailyLimit;
    _currentSugarIntake = prefs.getDouble(_prefsKeySugarIntake) ?? 0.0;
    _currentStreak = prefs.getInt(_prefsKeyStreak) ?? 0;
    
    // Load entries
    final entriesJson = prefs.getString(_prefsKeyEntries);
    if (entriesJson != null) {
      try {
        final entriesList = json.decode(entriesJson) as List;
        _todayEntries.clear();
        _todayEntries.addAll(
          entriesList.map((entryMap) => FoodEntry.fromJson(entryMap)).toList()
        );
      } catch (e) {
        AppLogger.logSugarTrackingError('Failed to load entries from storage', e);
      }
    }
    
    AppLogger.logState('Loaded from storage: ${_currentSugarIntake.toStringAsFixed(1)}g sugar, ${_todayEntries.length} entries');
  }
  
  /// Save current state to SharedPreferences
  Future<void> _saveToStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final today = DateTime.now().toIso8601String().split('T')[0];
      
      await Future.wait([
        prefs.setString(_prefsKeyLastDate, today),
        prefs.setDouble(_prefsKeyDailyLimit, _dailyLimit),
        prefs.setDouble(_prefsKeySugarIntake, _currentSugarIntake),
        prefs.setString(_prefsKeyEntries, json.encode(_todayEntries.map((e) => e.toJson()).toList())),
        prefs.setInt(_prefsKeyStreak, _currentStreak),
      ]);
      
      AppLogger.logState('Saved to storage: ${_currentSugarIntake.toStringAsFixed(1)}g sugar, ${_todayEntries.length} entries');
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to save to storage', e, stackTrace);
    }
  }
  
  /// Reset data for a new day
  Future<void> _resetForNewDay(SharedPreferences prefs, String today) async {
    // Load current streak from storage, starts at 0
    _currentStreak = prefs.getInt(_prefsKeyStreak) ?? 0;
    
    // Check if streak needs to be reset due to missing days
    final lastStreakDate = prefs.getString(_prefsKeyLastStreakDate);
    final yesterday = DateTime.now().subtract(const Duration(days: 1)).toIso8601String().split('T')[0];
    
    if (lastStreakDate != null && lastStreakDate != yesterday && _currentStreak > 0) {
      // Streak was broken due to missing day(s)
      _currentStreak = 0;
      AppLogger.logSugarTracking('Streak broken: missed a day');
    } else {
      AppLogger.logSugarTracking('Current streak: $_currentStreak days');
    }
    
    _currentSugarIntake = 0.0;
    _todayEntries.clear();
    
    await Future.wait([
      prefs.setString(_prefsKeyLastDate, today),
      prefs.setDouble(_prefsKeySugarIntake, 0.0),
      prefs.setString(_prefsKeyEntries, json.encode([])),
      prefs.setInt(_prefsKeyStreak, _currentStreak),
    ]);
  }
  
  /// Evaluate and update daily streak at end of day
  Future<bool> _evaluateDailyStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T')[0];
    final lastStreakDate = prefs.getString(_prefsKeyLastStreakDate);
    
    // Only evaluate if we haven't already evaluated today
    if (lastStreakDate == today) {
      return false; // Already evaluated for today, no changes made
    }
    
    final oldStreak = _currentStreak;
    
    if (_currentSugarIntake <= _dailyLimit) {
      // Under limit - achieved daily goal, increment streak
      _currentStreak++;
      
      // Mark today as a successful day
      await prefs.setString(_prefsKeyLastStreakDate, today);
      await prefs.setInt(_prefsKeyStreak, _currentStreak);
      
      AppLogger.logSugarTracking('Daily goal achieved! Streak: $_currentStreak days (stayed under ${_dailyLimit.toStringAsFixed(0)}g limit)');
    } else {
      // Over limit - goal not achieved, reset streak to 0
      _currentStreak = 0;
      await prefs.setInt(_prefsKeyStreak, 0);
      await prefs.remove(_prefsKeyLastStreakDate);
      
      AppLogger.logSugarTracking('Daily goal missed: ${_currentSugarIntake.toStringAsFixed(1)}g / ${_dailyLimit.toStringAsFixed(0)}g - streak reset to 0');
    }
    
    return _currentStreak != oldStreak; // Return true if streak changed
  }
  
  /// Check if we should evaluate daily streak (called when user opens app)
  Future<bool> checkDailyStreakEvaluation() async {
    return await _evaluateDailyStreak();
  }
  
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
      
      // Save to persistent storage
      await _saveToStorage();
      
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
  Future<bool> removeEntry(String entryId) async {
    final index = _todayEntries.indexWhere((entry) => entry.id == entryId);
    if (index != -1) {
      final entry = _todayEntries[index];
      _currentSugarIntake -= entry.sugarAmount;
      _todayEntries.removeAt(index);
      
      // Save to persistent storage
      await _saveToStorage();
      
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
  Future<void> setDailyLimit(double limit) async {
    final oldLimit = _dailyLimit;
    _dailyLimit = limit.clamp(0.0, double.infinity);
    
    // Save to persistent storage
    await _saveToStorage();
    
    AppLogger.logSugarTracking('Daily limit changed: ${oldLimit.toStringAsFixed(0)}g → ${_dailyLimit.toStringAsFixed(0)}g');
  }
  
  /// Reset today's tracking
  Future<void> resetToday() async {
    final oldTotal = _currentSugarIntake;
    final oldEntriesCount = _todayEntries.length;
    
    _currentSugarIntake = 0.0;
    _todayEntries.clear();
    
    // Save to persistent storage
    await _saveToStorage();
    
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
      streak: _currentStreak,
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
  
  /// Convert FoodEntry to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': {
        'barcode': product.barcode,
        'name': product.name,
        'brand': product.brand,
        'sugarPer100g': product.sugarPer100g,
        'imageUrl': product.imageUrl,
        'ingredients': product.ingredients,
        'nutritionGrade': product.nutritionGrade,
        'weightGrams': product.weightGrams,
      },
      'portionGrams': portionGrams,
      'sugarAmount': sugarAmount,
      'customName': customName,
      'timestamp': timestamp.toIso8601String(),
    };
  }
  
  /// Create FoodEntry from JSON
  factory FoodEntry.fromJson(Map<String, dynamic> json) {
    final productJson = json['product'] as Map<String, dynamic>;
    return FoodEntry(
      id: json['id'] as String,
      product: ProductInfo(
        barcode: productJson['barcode'] as String,
        name: productJson['name'] as String,
        brand: productJson['brand'] as String?,
        sugarPer100g: productJson['sugarPer100g'] as double?,
        imageUrl: productJson['imageUrl'] as String?,
        ingredients: productJson['ingredients'] as String?,
        nutritionGrade: productJson['nutritionGrade'] as String?,
        weightGrams: productJson['weightGrams'] as double?,
      ),
      portionGrams: json['portionGrams'] as double,
      sugarAmount: json['sugarAmount'] as double,
      customName: json['customName'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
  
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
  final int streak;
  
  DailySummary({
    required this.totalSugar,
    required this.dailyLimit,
    required this.remainingSugar,
    required this.progressPercentage,
    required this.status,
    required this.entries,
    required this.motivationalMessage,
    required this.streak,
  });
  
  bool get isUnderLimit => totalSugar <= dailyLimit;
  bool get isOverLimit => totalSugar > dailyLimit;
  bool get isCloseToLimit => progressPercentage > 0.8;
}
