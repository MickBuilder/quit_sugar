import 'package:quit_suggar/features/onboarding/domain/repositories/onboarding_repository.dart';

class CheckOnboardingStatusUseCase {
  final OnboardingRepository _repository;
  
  CheckOnboardingStatusUseCase(this._repository);
  
  Future<bool> call() async {
    return await _repository.isOnboardingCompleted();
  }
}