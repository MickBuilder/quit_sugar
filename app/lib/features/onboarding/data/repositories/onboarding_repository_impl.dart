import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:quit_suggar/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  static const String _onboardingCompletedKey = 'onboarding_completed';
  static const String _onboardingDataKey = 'onboarding_data';
  static const String _dailyLimitsProgressionKey = 'daily_limits_progression';
  
  @override
  Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingCompletedKey) ?? false;
  }
  
  @override
  Future<void> markOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingCompletedKey, true);
  }
  
  @override
  Future<void> saveOnboardingData(OnboardingData data) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(data.toJson());
    await prefs.setString(_onboardingDataKey, jsonString);
    
    // Also save the daily limits progression
    await updateDailyLimitsProgression(data.dailyLimitsProgression);
  }
  
  @override
  Future<OnboardingData?> getOnboardingData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_onboardingDataKey);
    
    if (jsonString == null) return null;
    
    try {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return OnboardingData.fromJson(jsonMap);
    } catch (e) {
      return null;
    }
  }
  
  @override
  Future<void> clearOnboardingData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_onboardingCompletedKey);
    await prefs.remove(_onboardingDataKey);
    await prefs.remove(_dailyLimitsProgressionKey);
  }
  
  @override
  Future<List<double>> getDailyLimitsProgression() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_dailyLimitsProgressionKey);
    
    if (jsonString == null) return [];
    
    try {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.cast<double>();
    } catch (e) {
      return [];
    }
  }
  
  @override
  Future<double> getCurrentDailyLimit() async {
    final onboardingData = await getOnboardingData();
    if (onboardingData == null) {
      return 25.0; // Default WHO recommendation
    }
    
    final startDate = onboardingData.startDate;
    final now = DateTime.now();
    final daysPassed = now.difference(startDate).inDays;
    
    if (daysPassed < 0) {
      // Haven't started yet, use current daily sugar
      return onboardingData.currentDailySugar;
    }
    
    if (daysPassed >= onboardingData.dailyLimitsProgression.length) {
      // Past the target date, use target daily sugar
      return onboardingData.targetDailySugar;
    }
    
    // Return the appropriate daily limit for today
    return onboardingData.dailyLimitsProgression[daysPassed];
  }
  
  @override
  Future<void> updateDailyLimitsProgression(List<double> progression) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(progression);
    await prefs.setString(_dailyLimitsProgressionKey, jsonString);
  }
}