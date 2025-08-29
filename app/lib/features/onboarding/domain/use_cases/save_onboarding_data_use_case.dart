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
    
    // Define weekly step-down schedule
    // Week 1: Personal baseline (currentDailySugar * 0.8)
    // Week 2-9: Fixed weekly limits
    final weeklyLimits = <double>[
      currentDailySugar * 0.8, // Week 1: Personal baseline
      25.0, // Week 2
      18.0, // Week 3: WHO level
      15.0, // Week 4
      12.0, // Week 5
      8.0,  // Week 6
      5.0,  // Week 7
      2.0,  // Week 8
      0.0,  // Week 9: Final push
    ];
    
    // Generate daily progression based on weekly limits
    for (int day = 0; day < targetDays; day++) {
      // Calculate which week we're in (0-based)
      final weekIndex = (day ~/ 7).clamp(0, weeklyLimits.length - 1);
      final weeklyLimit = weeklyLimits[weekIndex];
      
      // For Week 1, ensure we don't go above the user's baseline
      // For other weeks, use fixed limits but don't go above previous week
      double dailyLimit = weeklyLimit;
      
      // Ensure we never increase limits from previous day
      if (day > 0) {
        final previousLimit = progression[day - 1];
        dailyLimit = dailyLimit.clamp(0.0, previousLimit);
      }
      
      // Ensure we don't go below target (0g for eliminate goal)
      dailyLimit = dailyLimit.clamp(targetDailySugar, currentDailySugar);
      
      progression.add(double.parse(dailyLimit.toStringAsFixed(1)));
    }
    
    return progression;
  }
}