import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:quit_suggar/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:quit_suggar/features/onboarding/domain/use_cases/save_onboarding_data_use_case.dart';
import 'package:quit_suggar/features/onboarding/domain/use_cases/get_current_daily_limit_use_case.dart';
import 'package:quit_suggar/features/onboarding/domain/use_cases/check_onboarding_status_use_case.dart';

part 'onboarding_providers.g.dart';

@Riverpod(keepAlive: true)
OnboardingRepository onboardingRepository(Ref ref) {
  return OnboardingRepositoryImpl();
}

@Riverpod(keepAlive: true)
SaveOnboardingDataUseCase saveOnboardingDataUseCase(Ref ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return SaveOnboardingDataUseCase(repository);
}

@Riverpod(keepAlive: true)
GetCurrentDailyLimitUseCase getCurrentDailyLimitUseCase(Ref ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return GetCurrentDailyLimitUseCase(repository);
}

@Riverpod(keepAlive: true)
CheckOnboardingStatusUseCase checkOnboardingStatusUseCase(Ref ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return CheckOnboardingStatusUseCase(repository);
}

@riverpod
Future<bool> onboardingStatus(Ref ref) async {
  final useCase = ref.watch(checkOnboardingStatusUseCaseProvider);
  return await useCase();
}

@riverpod
Future<double> currentDailyLimit(Ref ref) async {
  final useCase = ref.watch(getCurrentDailyLimitUseCaseProvider);
  return await useCase();
}

@riverpod
Future<OnboardingData?> onboardingData(Ref ref) async {
  final repository = ref.watch(onboardingRepositoryProvider);
  return await repository.getOnboardingData();
}

// State management for onboarding flow
@riverpod
class OnboardingFlow extends _$OnboardingFlow {
  @override
  OnboardingData build() {
    return OnboardingData(
      name: '',
      age: 18,
      currentDailySugar: 0.0,
      sugarSources: const SugarSourcesProfile(
        sodaDrinks: 0,
        sweetSnacks: 0,
        desserts: 0,
        addedSugar: 0,
        juiceDrinks: 0,
        commonFoods: [],
      ),
      reductionGoal: SugarReductionGoal.healthy,
      targetDays: 60,
      targetDailySugar: SugarReductionGoal.healthy.targetAmount,
      motivation: '',
      lifeImpacts: [],
      analysisResults: {},
      vowSigned: false,
    );
  }
  
  void updatePersonalInfo({
    required String name,
    required int age,
  }) {
    state = state.copyWith(
      name: name,
      age: age,
    );
  }
  
  void updateSugarAssessment({
    required int sodaDrinks,
    required int sweetSnacks,
    required int desserts,
    required int addedSugar,
    required int juiceDrinks,
    required double currentDailySugar,
    List<String> commonFoods = const [],
  }) {
    state = state.copyWith(
      sugarSources: SugarSourcesProfile(
        sodaDrinks: sodaDrinks,
        sweetSnacks: sweetSnacks,
        desserts: desserts,
        addedSugar: addedSugar,
        juiceDrinks: juiceDrinks,
        commonFoods: commonFoods,
      ),
      currentDailySugar: currentDailySugar,
    );
  }
  
  void updateGoalSetting({
    required SugarReductionGoal reductionGoal,
    required int targetDays,
  }) {
    state = state.copyWith(
      reductionGoal: reductionGoal,
      targetDays: targetDays,
      targetDailySugar: reductionGoal.targetAmount,
    );
  }
  
  // Enhanced onboarding methods
  void updateMotivationReason(String motivation) {
    state = state.copyWith(motivation: motivation);
  }
  
  void updateAddictionIndicators({
    required int cravingIntensity,
    required int energyImpact,
    required int moodImpact,
    required int physicalSymptoms,
    required int stressEating,
    required int previousAttempts,
    required int totalScore,
  }) {
    // Store addiction indicators in analysis results
    final analysisResults = Map<String, dynamic>.from(state.analysisResults);
    analysisResults.addAll({
      'cravingIntensity': cravingIntensity,
      'energyImpact': energyImpact,
      'moodImpact': moodImpact,
      'physicalSymptoms': physicalSymptoms,
      'stressEating': stressEating,
      'previousAttempts': previousAttempts,
      'addictionScore': totalScore,
    });
    
    state = state.copyWith(analysisResults: analysisResults);
  }
  
  void updateLifestyleFactors({
    required int sleepQuality,
    required int primaryMotivation,
    required int socialEnvironment,
    required int stressLevels,
  }) {
    // Store lifestyle factors in analysis results
    final analysisResults = Map<String, dynamic>.from(state.analysisResults);
    analysisResults.addAll({
      'sleepQuality': sleepQuality,
      'primaryMotivation': primaryMotivation,
      'socialEnvironment': socialEnvironment,
      'stressLevels': stressLevels,
    });
    
    state = state.copyWith(analysisResults: analysisResults);
  }
  
  void updateLifeImpacts(List<String> lifeImpacts) {
    state = state.copyWith(lifeImpacts: lifeImpacts);
  }
  
  void updateAnalysisResults(Map<String, dynamic> analysisResults) {
    state = state.copyWith(analysisResults: analysisResults);
  }
  
  void signVow() {
    state = state.copyWith(vowSigned: true);
  }
  

  
  Future<void> saveOnboardingData() async {
    final useCase = ref.read(saveOnboardingDataUseCaseProvider);
    await useCase(state);
    
    // Invalidate related providers to refresh data
    ref.invalidate(onboardingStatusProvider);
    ref.invalidate(currentDailyLimitProvider);
    ref.invalidate(onboardingDataProvider);
  }
  
  void reset() {
    state = OnboardingData(
      name: '',
      age: 18,
      currentDailySugar: 0.0,
      sugarSources: const SugarSourcesProfile(
        sodaDrinks: 0,
        sweetSnacks: 0,
        desserts: 0,
        addedSugar: 0,
        juiceDrinks: 0,
        commonFoods: [],
      ),
      reductionGoal: SugarReductionGoal.healthy,
      targetDays: 60,
      targetDailySugar: SugarReductionGoal.healthy.targetAmount,
      motivation: '',
      lifeImpacts: [],
      analysisResults: {},
      vowSigned: false,
    );
  }
}