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
      gender: 'prefer_not_to_say',
      currentDailySugar: 25.0,
      sugarSources: const SugarSourcesProfile(
        sodaDrinks: 0,
        sweetSnacks: 0,
        desserts: 0,
        addedSugar: 0,
        juiceDrinks: 0,
        commonFoods: [],
      ),
      healthConditions: [],
      hasSpecialDiet: false,
      dietType: null,
      reductionGoal: SugarReductionGoal.healthy,
      primaryMotivation: '',
      targetDays: 45,
      targetDailySugar: 25.0,
      dailyLimitsProgression: [],
      startDate: DateTime.now(),
      targetDate: DateTime.now().add(const Duration(days: 45)),
    );
  }
  
  void updatePersonalInfo({
    required String name,
    required int age,
    required String gender,
  }) {
    state = state.copyWith(
      name: name,
      age: age,
      gender: gender,
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
    final targetDate = state.startDate.add(Duration(days: targetDays));
    
    state = state.copyWith(
      reductionGoal: reductionGoal,
      targetDays: targetDays,
      targetDailySugar: reductionGoal.targetAmount,
      targetDate: targetDate,
    );
  }
  
  void updateHealthConditions(List<HealthCondition> healthConditions) {
    state = state.copyWith(healthConditions: healthConditions);
  }
  
  void updateMotivation(String motivation) {
    state = state.copyWith(primaryMotivation: motivation);
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
      gender: 'prefer_not_to_say',
      currentDailySugar: 25.0,
      sugarSources: const SugarSourcesProfile(
        sodaDrinks: 0,
        sweetSnacks: 0,
        desserts: 0,
        addedSugar: 0,
        juiceDrinks: 0,
        commonFoods: [],
      ),
      healthConditions: [],
      hasSpecialDiet: false,
      dietType: null,
      reductionGoal: SugarReductionGoal.healthy,
      primaryMotivation: '',
      targetDays: 45,
      targetDailySugar: 25.0,
      dailyLimitsProgression: [],
      startDate: DateTime.now(),
      targetDate: DateTime.now().add(const Duration(days: 45)),
    );
  }
}