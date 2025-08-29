import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quit_suggar/features/program/domain/entities/celebration.dart';
import 'package:quit_suggar/features/program/presentation/providers/program_provider.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/program_phase.dart';

part 'celebration_provider.g.dart';

@riverpod
Future<Celebration?> todayCelebration(ref) async {
  final programState = await ref.watch(programProgressProvider.future);
  
  if (!programState.isActive) return null;
  
  final currentDay = programState.currentDay;
  
  // Check if today is a celebration day
  if (!ProgramPhaseExtension.isCelebrationDay(currentDay)) {
    return null;
  }
  
  final currentPhase = programState.currentPhase!;
  final currentWeek = programState.currentWeek;
  
  // Determine celebration type and create celebration
  if (ProgramPhaseExtension.isMajorMilestone(currentDay)) {
    return CelebrationFactory.createMajorMilestone(
      day: currentDay,
      week: currentWeek,
      phase: currentPhase,
    );
  } else {
    return CelebrationFactory.createWeeklyCompletion(
      day: currentDay,
      week: currentWeek,
      phase: currentPhase,
    );
  }
}

@riverpod
Future<bool> shouldShowCelebration(ref) async {
  final celebration = await ref.watch(todayCelebrationProvider.future);
  return celebration != null;
}

// Provider to track if user has seen today's celebration
@riverpod
class CelebrationSeen extends _$CelebrationSeen {
  @override
  Set<int> build() {
    // In a real app, this would be persisted to storage
    // For now, we'll just track in memory
    return <int>{};
  }

  void markSeen(int day) {
    state = {...state, day};
  }

  bool hasSeen(int day) {
    return state.contains(day);
  }
}