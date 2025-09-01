import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_data.freezed.dart';
part 'onboarding_data.g.dart';

@freezed
abstract class OnboardingData with _$OnboardingData {
  const factory OnboardingData({
    // Personal info
    required String name,
    required int age,
    
    // Current sugar habits
    required double currentDailySugar,
    required SugarSourcesProfile sugarSources,
    
    // Goals and plan
    required SugarReductionGoal reductionGoal,
    required int targetDays, // Usually 60 days
    required double targetDailySugar,
    
    // Motivation and analysis
    required String motivation,
    required List<String> lifeImpacts,
    required Map<String, dynamic> analysisResults,
    required bool vowSigned,
  }) = _OnboardingData;

  const OnboardingData._();

  factory OnboardingData.fromJson(Map<String, dynamic> json) => 
      _$OnboardingDataFromJson(json);

  // Helper methods
  double get reductionPercentage => 
      ((currentDailySugar - targetDailySugar) / currentDailySugar * 100).clamp(0, 100);
  
  double get dailyReductionAmount => 
      (currentDailySugar - targetDailySugar) / targetDays;
      
  String get motivationalSummary {
    final reduction = reductionPercentage.toStringAsFixed(0);
    return 'Reduce sugar by $reduction% in $targetDays days';
  }
}

@freezed
abstract class SugarSourcesProfile with _$SugarSourcesProfile {
  const factory SugarSourcesProfile({
    required int sodaDrinks, // per week
    required int sweetSnacks, // per week
    required int desserts, // per week
    required int addedSugar, // teaspoons per day
    required int juiceDrinks, // per week
    required List<String> commonFoods,
  }) = _SugarSourcesProfile;

  factory SugarSourcesProfile.fromJson(Map<String, dynamic> json) => 
      _$SugarSourcesProfileFromJson(json);
}

enum HealthCondition {
  diabetes,
  prediabetes,
  heartDisease,
  weightConcerns,
  dentalIssues,
  energyCrashes,
  none,
}

enum SugarReductionGoal {
  eliminate, // 0g target
  minimal, // 10g target
  moderate, // 15g target
  healthy, // 25g WHO limit
}

extension SugarReductionGoalExtension on SugarReductionGoal {
  double get targetAmount {
    switch (this) {
      case SugarReductionGoal.eliminate:
        return 0.0;
      case SugarReductionGoal.minimal:
        return 10.0;
      case SugarReductionGoal.moderate:
        return 15.0;
      case SugarReductionGoal.healthy:
        return 25.0;
    }
  }

  String get description {
    switch (this) {
      case SugarReductionGoal.eliminate:
        return 'Complete elimination of added sugar';
      case SugarReductionGoal.minimal:
        return 'Very low sugar intake (10g/day)';
      case SugarReductionGoal.moderate:
        return 'Moderate reduction (15g/day)';
      case SugarReductionGoal.healthy:
        return 'WHO recommended limit (25g/day)';
    }
  }

  String get title {
    switch (this) {
      case SugarReductionGoal.eliminate:
        return 'Sugar Free';
      case SugarReductionGoal.minimal:
        return 'Minimal Sugar';
      case SugarReductionGoal.moderate:
        return 'Moderate';
      case SugarReductionGoal.healthy:
        return 'Healthy Limit';
    }
  }
}