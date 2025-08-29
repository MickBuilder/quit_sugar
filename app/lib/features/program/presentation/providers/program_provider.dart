import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/program_phase.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';

part 'program_provider.g.dart';

@riverpod
Future<ProgramProgressState> programProgress(ref) async {
  // Get onboarding data to determine program start date
  final onboardingData = await ref.watch(onboardingDataProvider.future);
    
  if (onboardingData == null) {
    return ProgramProgressState.notStarted();
  }
  
  // Calculate current day in program
  final now = DateTime.now();
  final startDate = onboardingData.startDate;
  final daysSinceStart = now.difference(startDate).inDays + 1;
  
  // Clamp to valid range (1-60)
  final currentDay = daysSinceStart.clamp(1, 60);
  
  return ProgramProgressState.active(
    currentDay: currentDay,
    totalDays: 60,
    startDate: startDate,
    currentPhase: ProgramPhaseExtension.fromDay(currentDay),
    currentWeek: ProgramPhaseExtension.weekFromDay(currentDay),
    dailyLimits: onboardingData.dailyLimitsProgression,
  );
}

class ProgramProgressState {
  final bool isActive;
  final int currentDay;
  final int totalDays;
  final DateTime? startDate;
  final ProgramPhase? currentPhase;
  final int currentWeek;
  final List<double> dailyLimits;

  const ProgramProgressState({
    required this.isActive,
    required this.currentDay,
    required this.totalDays,
    this.startDate,
    this.currentPhase,
    required this.currentWeek,
    required this.dailyLimits,
  });

  factory ProgramProgressState.notStarted() {
    return const ProgramProgressState(
      isActive: false,
      currentDay: 0,
      totalDays: 60,
      currentWeek: 0,
      dailyLimits: [],
    );
  }

  factory ProgramProgressState.active({
    required int currentDay,
    required int totalDays,
    required DateTime startDate,
    required ProgramPhase currentPhase,
    required int currentWeek,
    required List<double> dailyLimits,
  }) {
    return ProgramProgressState(
      isActive: true,
      currentDay: currentDay,
      totalDays: totalDays,
      startDate: startDate,
      currentPhase: currentPhase,
      currentWeek: currentWeek,
      dailyLimits: dailyLimits,
    );
  }

  // Helper getters
  double get progressPercentage => currentDay / totalDays;
  
  double get currentDailyLimit {
    if (currentDay <= 0 || currentDay > dailyLimits.length) return 0.0;
    return dailyLimits[currentDay - 1];
  }

  int get daysInCurrentPhase {
    if (currentPhase == null) return 0;
    return currentDay - currentPhase!.startDay + 1;
  }

  int get daysLeftInCurrentPhase {
    if (currentPhase == null) return 0;
    return currentPhase!.endDay - currentDay;
  }

  int get daysLeftTotal => totalDays - currentDay;

  bool get isWeekEnd => currentDay % 7 == 0;
  
  bool get isMajorMilestone => ProgramPhaseExtension.isMajorMilestone(currentDay);

  String get phaseDescription {
    return currentPhase?.description ?? 'Program not started';
  }

  String get weekInPhase {
    if (currentPhase == null) return '';
    final weekInPhase = ((currentDay - currentPhase!.startDay) ~/ 7) + 1;
    return 'Week $weekInPhase';
  }
}