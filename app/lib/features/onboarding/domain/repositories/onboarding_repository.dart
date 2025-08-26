import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';

abstract class OnboardingRepository {
  Future<bool> isOnboardingCompleted();
  Future<void> markOnboardingCompleted();
  Future<void> saveOnboardingData(OnboardingData data);
  Future<OnboardingData?> getOnboardingData();
  Future<void> clearOnboardingData();
  
  // Daily limits progression management
  Future<List<double>> getDailyLimitsProgression();
  Future<double> getCurrentDailyLimit();
  Future<void> updateDailyLimitsProgression(List<double> progression);
}