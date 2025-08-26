import 'package:quit_suggar/features/onboarding/domain/repositories/onboarding_repository.dart';

class GetCurrentDailyLimitUseCase {
  final OnboardingRepository _repository;
  
  GetCurrentDailyLimitUseCase(this._repository);
  
  Future<double> call() async {
    return await _repository.getCurrentDailyLimit();
  }
}