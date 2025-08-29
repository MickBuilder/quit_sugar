import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdrawal_symptom.freezed.dart';
part 'withdrawal_symptom.g.dart';

enum SymptomType {
  headaches,
  cravings,
  energy,
  mood,
}

extension SymptomTypeExtension on SymptomType {
  String get title {
    switch (this) {
      case SymptomType.headaches:
        return 'Headaches';
      case SymptomType.cravings:
        return 'Cravings';
      case SymptomType.energy:
        return 'Energy Level';
      case SymptomType.mood:
        return 'Mood';
    }
  }

  String get description {
    switch (this) {
      case SymptomType.headaches:
        return 'How intense are your headaches?';
      case SymptomType.cravings:
        return 'How strong are your sugar cravings?';
      case SymptomType.energy:
        return 'How is your energy level?';
      case SymptomType.mood:
        return 'How is your mood today?';
    }
  }

  String get icon {
    switch (this) {
      case SymptomType.headaches:
        return '🤕';
      case SymptomType.cravings:
        return '🍭';
      case SymptomType.energy:
        return '⚡';
      case SymptomType.mood:
        return '😊';
    }
  }

  /// Get intensity label for 1-5 scale
  String intensityLabel(int intensity) {
    switch (this) {
      case SymptomType.headaches:
        switch (intensity) {
          case 1: return 'None';
          case 2: return 'Mild';
          case 3: return 'Moderate';
          case 4: return 'Strong';
          case 5: return 'Severe';
          default: return 'Unknown';
        }
      case SymptomType.cravings:
        switch (intensity) {
          case 1: return 'None';
          case 2: return 'Mild';
          case 3: return 'Moderate';
          case 4: return 'Strong';
          case 5: return 'Intense';
          default: return 'Unknown';
        }
      case SymptomType.energy:
        switch (intensity) {
          case 1: return 'Very Low';
          case 2: return 'Low';
          case 3: return 'Normal';
          case 4: return 'High';
          case 5: return 'Very High';
          default: return 'Unknown';
        }
      case SymptomType.mood:
        switch (intensity) {
          case 1: return 'Very Low';
          case 2: return 'Low';
          case 3: return 'Neutral';
          case 4: return 'Good';
          case 5: return 'Great';
          default: return 'Unknown';
        }
    }
  }
}

@freezed
abstract class WithdrawalSymptom with _$WithdrawalSymptom {
  const factory WithdrawalSymptom({
    required String id,
    required SymptomType type,
    required int intensity,
    required DateTime recordedAt,
    String? notes,
  }) = _WithdrawalSymptom;

  const WithdrawalSymptom._();

  factory WithdrawalSymptom.fromJson(Map<String, dynamic> json) =>
      _$WithdrawalSymptomFromJson(json);

  /// Helper to create a new symptom with current timestamp
  factory WithdrawalSymptom.create({
    required SymptomType type,
    required int intensity,
    String? notes,
  }) {
    return WithdrawalSymptom(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: type,
      intensity: intensity.clamp(1, 5),
      recordedAt: DateTime.now(),
      notes: notes,
    );
  }

  String get intensityLabel => type.intensityLabel(intensity);
}

@freezed
abstract class DailySymptomLog with _$DailySymptomLog {
  const factory DailySymptomLog({
    required DateTime date,
    required List<WithdrawalSymptom> symptoms,
    String? generalNotes,
    @Default(false) bool completed,
  }) = _DailySymptomLog;

  const DailySymptomLog._();

  factory DailySymptomLog.fromJson(Map<String, dynamic> json) =>
      _$DailySymptomLogFromJson(json);

  /// Create empty daily log for a specific date
  factory DailySymptomLog.forDate(DateTime date) {
    return DailySymptomLog(
      date: DateTime(date.year, date.month, date.day),
      symptoms: [],
    );
  }

  /// Get symptom by type, returns null if not recorded
  WithdrawalSymptom? getSymptom(SymptomType type) {
    try {
      return symptoms.firstWhere((symptom) => symptom.type == type);
    } catch (e) {
      return null;
    }
  }

  /// Check if all 4 symptom types are recorded
  bool get isComplete {
    return SymptomType.values.every((type) => getSymptom(type) != null);
  }

  /// Average intensity across all symptoms (for overview)
  double get averageIntensity {
    if (symptoms.isEmpty) return 0.0;
    final total = symptoms.fold<int>(0, (sum, symptom) => sum + symptom.intensity);
    return total / symptoms.length;
  }

  /// Add or update symptom
  DailySymptomLog updateSymptom(WithdrawalSymptom newSymptom) {
    final updatedSymptoms = symptoms.where((s) => s.type != newSymptom.type).toList();
    updatedSymptoms.add(newSymptom);
    
    return copyWith(
      symptoms: updatedSymptoms,
      completed: _checkIfCompleted(updatedSymptoms),
    );
  }

  bool _checkIfCompleted(List<WithdrawalSymptom> symptoms) {
    return SymptomType.values.every((type) => 
      symptoms.any((symptom) => symptom.type == type)
    );
  }
}