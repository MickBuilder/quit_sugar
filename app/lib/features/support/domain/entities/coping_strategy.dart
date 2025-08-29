enum CopingStrategyType {
  immediate,
  distraction,
  physical,
  mindful,
}

extension CopingStrategyTypeExtension on CopingStrategyType {
  String get title {
    switch (this) {
      case CopingStrategyType.immediate:
        return 'Immediate Relief';
      case CopingStrategyType.distraction:
        return 'Distraction';
      case CopingStrategyType.physical:
        return 'Physical Activity';
      case CopingStrategyType.mindful:
        return 'Mindfulness';
    }
  }

  String get icon {
    switch (this) {
      case CopingStrategyType.immediate:
        return '⚡';
      case CopingStrategyType.distraction:
        return '🎯';
      case CopingStrategyType.physical:
        return '🏃';
      case CopingStrategyType.mindful:
        return '🧘';
    }
  }
}

class CopingStrategy {
  final String id;
  final CopingStrategyType type;
  final String title;
  final String description;
  final String action;
  final int durationMinutes;

  const CopingStrategy({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.action,
    required this.durationMinutes,
  });
}

class CopingStrategies {
  static const List<CopingStrategy> all = [
    // Immediate Relief
    CopingStrategy(
      id: 'water',
      type: CopingStrategyType.immediate,
      title: 'Drink Water',
      description: 'Dehydration can trigger sugar cravings',
      action: 'Drink a full glass of water slowly',
      durationMinutes: 2,
    ),
    CopingStrategy(
      id: 'fruit',
      type: CopingStrategyType.immediate,
      title: 'Eat Fresh Fruit',
      description: 'Natural sugars can satisfy cravings healthily',
      action: 'Have an apple, berries, or your favorite fruit',
      durationMinutes: 5,
    ),
    CopingStrategy(
      id: 'brushTeeth',
      type: CopingStrategyType.immediate,
      title: 'Brush Your Teeth',
      description: 'The mint taste reduces sugar cravings',
      action: 'Brush your teeth with mint toothpaste',
      durationMinutes: 3,
    ),
    
    // Distraction
    CopingStrategy(
      id: 'call',
      type: CopingStrategyType.distraction,
      title: 'Call Someone',
      description: 'Social connection helps overcome cravings',
      action: 'Call a friend, family member, or support buddy',
      durationMinutes: 10,
    ),
    CopingStrategy(
      id: 'hobby',
      type: CopingStrategyType.distraction,
      title: 'Do a Quick Hobby',
      description: 'Engage your mind in something enjoyable',
      action: 'Read, draw, play an instrument, or craft for a few minutes',
      durationMinutes: 15,
    ),
    CopingStrategy(
      id: 'music',
      type: CopingStrategyType.distraction,
      title: 'Listen to Music',
      description: 'Music can shift your mood and focus',
      action: 'Put on your favorite energizing playlist',
      durationMinutes: 10,
    ),
    
    // Physical Activity
    CopingStrategy(
      id: 'walk',
      type: CopingStrategyType.physical,
      title: 'Take a Walk',
      description: 'Physical movement reduces stress and cravings',
      action: 'Go for a 5-10 minute walk outside or around your home',
      durationMinutes: 10,
    ),
    CopingStrategy(
      id: 'stretch',
      type: CopingStrategyType.physical,
      title: 'Stretch & Move',
      description: 'Light exercise releases feel-good endorphins',
      action: 'Do some simple stretches, jumping jacks, or yoga poses',
      durationMinutes: 5,
    ),
    CopingStrategy(
      id: 'dance',
      type: CopingStrategyType.physical,
      title: 'Dance It Out',
      description: 'Movement and music combine for powerful distraction',
      action: 'Put on music and dance for a few minutes',
      durationMinutes: 5,
    ),
    
    // Mindfulness
    CopingStrategy(
      id: 'breathing',
      type: CopingStrategyType.mindful,
      title: '4-7-8 Breathing',
      description: 'Controlled breathing calms the nervous system',
      action: 'Inhale for 4, hold for 7, exhale for 8. Repeat 4 times.',
      durationMinutes: 3,
    ),
    CopingStrategy(
      id: 'gratitude',
      type: CopingStrategyType.mindful,
      title: 'Gratitude Practice',
      description: 'Positive focus shifts attention from cravings',
      action: 'Think of 3 things you\'re grateful for today',
      durationMinutes: 3,
    ),
    CopingStrategy(
      id: 'affirmation',
      type: CopingStrategyType.mindful,
      title: 'Positive Affirmations',
      description: 'Remind yourself of your strength and goals',
      action: 'Repeat: "I am stronger than this craving. I choose health."',
      durationMinutes: 2,
    ),
  ];

  static List<CopingStrategy> getByType(CopingStrategyType type) {
    return all.where((strategy) => strategy.type == type).toList();
  }

  static List<CopingStrategy> getQuickStrategies() {
    return all.where((strategy) => strategy.durationMinutes <= 5).toList();
  }

  static CopingStrategy? getById(String id) {
    try {
      return all.firstWhere((strategy) => strategy.id == id);
    } catch (e) {
      return null;
    }
  }
}