import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:quit_suggar/features/onboarding/domain/repositories/onboarding_repository.dart';

class SaveOnboardingDataUseCase {
  final OnboardingRepository _repository;
  
  SaveOnboardingDataUseCase(this._repository);
  
  Future<void> call(OnboardingData data) async {
    // Generate daily limits progression based on the goal
    final dailyLimitsProgression = _generateDailyLimitsProgression(
      data.currentDailySugar,
      data.targetDailySugar,
      data.targetDays,
    );
    
    final completeData = data.copyWith(
      dailyLimitsProgression: dailyLimitsProgression,
    );
    
    await _repository.saveOnboardingData(completeData);
    await _repository.markOnboardingCompleted();
  }
  
  List<double> _generateDailyLimitsProgression(
    double currentDailySugar,
    double targetDailySugar,
    int targetDays,
  ) {
    final progression = <double>[];
    
    // Handle edge case: if current is already at or below target
    if (currentDailySugar <= targetDailySugar) {
      // Stay at current level throughout the program
      for (int day = 0; day < targetDays; day++) {
        progression.add(double.parse(currentDailySugar.toStringAsFixed(1)));
      }
      return progression;
    }
    
    final totalReduction = currentDailySugar - targetDailySugar;
    
    for (int day = 0; day < targetDays; day++) {
      // Calculate the reduction progress for this day (0.0 to 1.0)
      final progress = day / (targetDays - 1);
      
      // Use a smooth curve for reduction (quadratic easing)
      final easedProgress = progress * progress;
      
      // Calculate the daily limit for this day
      final dailyLimit = currentDailySugar - (totalReduction * easedProgress);
      
      // Clamp with correct bounds (min = target, max = current)
      final clampedLimit = dailyLimit.clamp(targetDailySugar, currentDailySugar);
      
      progression.add(double.parse(clampedLimit.toStringAsFixed(1)));
    }
    
    return progression;
  }
}