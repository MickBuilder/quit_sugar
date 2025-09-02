import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/storage/hive_storage_service.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:quit_suggar/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  
  @override
  Future<bool> isOnboardingCompleted() async {
    return await HiveStorageService.getOnboardingCompleted();
  }
  
  @override
  Future<void> markOnboardingCompleted() async {
    await HiveStorageService.saveOnboardingCompleted(true);
  }
  
  @override
  Future<void> saveOnboardingData(OnboardingData data) async {
    final jsonData = data.toJson();
    await HiveStorageService.saveOnboardingData(jsonData);
  }
  
  @override
  Future<OnboardingData?> getOnboardingData() async {
    final jsonData = await HiveStorageService.getOnboardingData();
    
    if (jsonData == null) return null;
    
    try {
      return OnboardingData.fromJson(jsonData);
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError('Failed to parse onboarding data', e, stackTrace);
      return null;
    }
  }
  
  @override
  Future<void> clearOnboardingData() async {
    await HiveStorageService.saveOnboardingCompleted(false);
    await HiveStorageService.saveOnboardingData({});
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