import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:quit_suggar/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  static const String _onboardingCompletedKey = 'onboarding_completed';
  static const String _onboardingDataKey = 'onboarding_data';

  
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
  }
  

  
  @override
  Future<double> getCurrentDailyLimit() async {
    final onboardingData = await getOnboardingData();
    if (onboardingData == null) {
      return 25.0; // Default WHO recommendation
    }
    
    // Since we don't have startDate and dailyLimitsProgression anymore,
    // we'll use a simple approach: gradually reduce from current to target
    final now = DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;
    final daysIntoProgram = dayOfYear % 365; // Assume program restarts yearly
    
    if (daysIntoProgram >= onboardingData.targetDays) {
      // Past the target date, use target daily sugar
      return onboardingData.targetDailySugar;
    }
    
    // Calculate a simple linear reduction
    final progress = daysIntoProgram / onboardingData.targetDays;
    final currentLimit = onboardingData.currentDailySugar - 
        (onboardingData.currentDailySugar - onboardingData.targetDailySugar) * progress;
    
    return currentLimit.clamp(onboardingData.targetDailySugar, onboardingData.currentDailySugar);
  }
  

}