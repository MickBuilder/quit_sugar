enum SugarStatus {
  green, // 0-70% of limit
  yellow, // 70-90% of limit
  red, // 90-100% of limit
  overLimit, // >100% of limit
}

/// Utility class for calculating SugarStatus from percentage
class SugarStatusCalculator {
  /// Creates a SugarStatus based on the progress percentage (0.0 to 1.0+)
  /// 
  /// Thresholds:
  /// - 0-70%: green (good)
  /// - 70-90%: yellow (moderate)
  /// - 90-100%: red (approaching limit)
  /// - >100%: overLimit (exceeded daily limit)
  static SugarStatus fromPercentage(double percentage) {
    if (percentage <= 0.7) return SugarStatus.green;
    if (percentage <= 0.9) return SugarStatus.yellow;
    if (percentage <= 1.0) return SugarStatus.red;
    return SugarStatus.overLimit;
  }
}
