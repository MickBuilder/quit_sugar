enum ProgramPhase {
  initialReduction, // Days 1-21 (Weeks 1-3)
  deepElimination,  // Days 22-42 (Weeks 4-6) 
  zeroSugar,        // Days 43-60 (Weeks 7-9)
}

extension ProgramPhaseExtension on ProgramPhase {
  String get title {
    switch (this) {
      case ProgramPhase.initialReduction:
        return 'Initial Reduction';
      case ProgramPhase.deepElimination:
        return 'Deep Elimination';
      case ProgramPhase.zeroSugar:
        return 'Zero Added Sugar';
    }
  }

  String get description {
    switch (this) {
      case ProgramPhase.initialReduction:
        return 'Adjusting to limits and breaking habits';
      case ProgramPhase.deepElimination:
        return 'Eliminating hidden sugars';
      case ProgramPhase.zeroSugar:
        return 'Living sugar-free';
    }
  }

  int get startDay {
    switch (this) {
      case ProgramPhase.initialReduction:
        return 1;
      case ProgramPhase.deepElimination:
        return 22;
      case ProgramPhase.zeroSugar:
        return 43;
    }
  }

  int get endDay {
    switch (this) {
      case ProgramPhase.initialReduction:
        return 21;
      case ProgramPhase.deepElimination:
        return 42;
      case ProgramPhase.zeroSugar:
        return 60;
    }
  }

  /// Get the current program phase based on day number (1-60)
  static ProgramPhase fromDay(int day) {
    if (day <= 21) {
      return ProgramPhase.initialReduction;
    } else if (day <= 42) {
      return ProgramPhase.deepElimination;
    } else {
      return ProgramPhase.zeroSugar;
    }
  }

  /// Get current week number (1-9) based on day number (1-60)
  static int weekFromDay(int day) {
    return ((day - 1) ~/ 7) + 1;
  }

  /// Get day within current week (1-7) based on day number (1-60)
  static int dayWithinWeek(int day) {
    return ((day - 1) % 7) + 1;
  }

  /// Check if this day is a week completion (day 7, 14, 21, etc.)
  static bool isWeekCompletion(int day) {
    return day % 7 == 0;
  }

  /// Check if this day is a major milestone (day 21, 42, 60)
  static bool isMajorMilestone(int day) {
    return day == 21 || day == 42 || day == 60;
  }

  /// Check if this day is a celebration day (weekly completion or major milestone)
  static bool isCelebrationDay(int day) {
    return isWeekCompletion(day) || isMajorMilestone(day);
  }

  /// Get all celebration days (weekly + major milestones)
  static List<int> get allCelebrationDays {
    // Weekly completions: 7, 14, 21, 28, 35, 42, 49, 56
    final weeklyDays = List.generate(8, (index) => (index + 1) * 7);
    
    // Major milestones: 21, 42, 60 (21 already in weekly)
    final majorDays = [21, 42, 60];
    
    // Combine and remove duplicates
    final allDays = {...weeklyDays, ...majorDays}.toList();
    allDays.sort();
    
    return allDays;
  }
}