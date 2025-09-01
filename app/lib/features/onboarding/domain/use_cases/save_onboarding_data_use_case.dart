import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:quit_suggar/features/onboarding/domain/repositories/onboarding_repository.dart';

class SaveOnboardingDataUseCase {
  final OnboardingRepository _repository;
  
  SaveOnboardingDataUseCase(this._repository);
  
  Future<void> call(OnboardingData data) async {
    await _repository.saveOnboardingData(data);
    await _repository.markOnboardingCompleted();
  }
}