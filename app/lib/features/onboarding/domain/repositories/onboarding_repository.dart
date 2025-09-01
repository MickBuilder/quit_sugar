import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';

abstract class OnboardingRepository {
  Future<bool> isOnboardingCompleted();
  Future<void> markOnboardingCompleted();
  Future<void> saveOnboardingData(OnboardingData data);
  Future<OnboardingData?> getOnboardingData();
  Future<void> clearOnboardingData();
  
  // Current daily limit calculation
  Future<double> getCurrentDailyLimit();
}