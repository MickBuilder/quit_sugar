import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/program_phase.dart';

part 'celebration.g.dart';
part 'celebration.freezed.dart';

enum CelebrationType {
  weeklyCompletion,
  majorMilestone,
}

@freezed
abstract class Celebration with _$Celebration {
  const factory Celebration({
    required CelebrationType type,
    required int day,
    required int week,
    required ProgramPhase phase,
    required String title,
    required String message,
    required String badge,
    required List<String> achievements,
  }) = _Celebration;

  factory Celebration.fromJson(Map<String, dynamic> json) => _$CelebrationFromJson(json);
}

extension CelebrationTypeExtension on CelebrationType {
  String get title {
    switch (this) {
      case CelebrationType.weeklyCompletion:
        return 'Week Complete!';
      case CelebrationType.majorMilestone:
        return 'Major Milestone!';
    }
  }

  String get emoji {
    switch (this) {
      case CelebrationType.weeklyCompletion:
        return '🎉';
      case CelebrationType.majorMilestone:
        return '🏆';
    }
  }
}

class CelebrationFactory {
  static Celebration createWeeklyCompletion({
    required int day,
    required int week,
    required ProgramPhase phase,
  }) {
    return Celebration(
      type: CelebrationType.weeklyCompletion,
      day: day,
      week: week,
      phase: phase,
      title: 'Week $week Complete!',
      message: _getWeeklyMessage(week, phase),
      badge: _getWeeklyBadge(week),
      achievements: _getWeeklyAchievements(week, phase),
    );
  }

  static Celebration createMajorMilestone({
    required int day,
    required int week,
    required ProgramPhase phase,
  }) {
    return Celebration(
      type: CelebrationType.majorMilestone,
      day: day,
      week: week,
      phase: phase,
      title: _getMilestoneTitle(day),
      message: _getMilestoneMessage(day, phase),
      badge: _getMilestoneBadge(day),
      achievements: _getMilestoneAchievements(day, phase),
    );
  }

  static String _getWeeklyMessage(int week, ProgramPhase phase) {
    switch (week) {
      case 1:
        return 'Amazing start! You\'ve taken the first crucial step in your sugar-free journey.';
      case 2:
        return 'Two weeks strong! Your body is starting to adapt to lower sugar levels.';
      case 3:
        return 'Three weeks of dedication! You\'re building incredible momentum.';
      case 4:
        return 'One month complete! You\'ve officially entered the Deep Elimination phase.';
      case 5:
        return 'Five weeks of consistency! Your sugar cravings should be significantly reduced.';
      case 6:
        return 'Six weeks down! You\'re in the final phase - Zero Sugar territory.';
      case 7:
        return 'Seven weeks of triumph! The finish line is in sight.';
      case 8:
        return 'Eight weeks of incredible dedication! You\'re almost there!';
      default:
        return 'Another week of progress! Keep pushing forward.';
    }
  }

  static String _getWeeklyBadge(int week) {
    switch (week) {
      case 1:
        return '🌱';
      case 2:
        return '💪';
      case 3:
        return '🔥';
      case 4:
        return '⭐';
      case 5:
        return '🏅';
      case 6:
        return '💎';
      case 7:
        return '👑';
      case 8:
        return '🏆';
      default:
        return '🎉';
    }
  }

  static List<String> _getWeeklyAchievements(int week, ProgramPhase phase) {
    List<String> achievements = [
      'Completed Week $week',
      '${week * 7} days sugar-free progress',
    ];

    switch (week) {
      case 1:
        achievements.add('Overcame initial sugar withdrawal');
        break;
      case 2:
        achievements.add('Built consistent healthy habits');
        break;
      case 3:
        achievements.add('Mastered craving management');
        break;
      case 4:
        achievements.add('Entered Deep Elimination phase');
        break;
      case 5:
        achievements.add('Achieved significant craving reduction');
        break;
      case 6:
        achievements.add('Entered Zero Sugar phase');
        break;
      case 7:
        achievements.add('Demonstrated exceptional willpower');
        break;
      case 8:
        achievements.add('Nearly completed the full program');
        break;
    }

    return achievements;
  }

  static String _getMilestoneTitle(int day) {
    switch (day) {
      case 21:
        return '21-Day Milestone!';
      case 42:
        return '6-Week Achievement!';
      case 60:
        return 'Program Complete!';
      default:
        return 'Major Milestone!';
    }
  }

  static String _getMilestoneMessage(int day, ProgramPhase phase) {
    switch (day) {
      case 21:
        return 'Incredible! 21 days is when new habits truly begin to stick. You\'ve rewired your relationship with sugar!';
      case 42:
        return 'Outstanding! Six weeks of dedication have transformed your body\'s sugar response. You\'re in elite territory now.';
      case 60:
        return 'CONGRATULATIONS! You\'ve completed the full 60-day program. You\'ve officially broken free from sugar addiction!';
      default:
        return 'You\'ve reached a major milestone in your sugar-free journey!';
    }
  }

  static String _getMilestoneBadge(int day) {
    switch (day) {
      case 21:
        return '🌟';
      case 42:
        return '💎';
      case 60:
        return '👑';
      default:
        return '🏆';
    }
  }

  static List<String> _getMilestoneAchievements(int day, ProgramPhase phase) {
    List<String> achievements = [];

    switch (day) {
      case 21:
        achievements = [
          'Habit Formation Master',
          'Sugar Craving Conqueror',
          'Initial Reduction Champion',
          '21 days of consistent progress',
          'Rewired brain sugar pathways',
        ];
        break;
      case 42:
        achievements = [
          'Deep Elimination Expert',
          'Withdrawal Warrior',
          'Sugar-Free Strategist',
          '42 days of dedication',
          'Transformed metabolism',
          'Elite self-control',
        ];
        break;
      case 60:
        achievements = [
          'Sugar Addiction Liberator',
          'Program Completion Master',
          'Zero Sugar Champion',
          '60 days of transformation',
          'Permanent lifestyle change',
          'Inspiration to others',
          'Peak health achievement',
        ];
        break;
    }

    return achievements;
  }
}