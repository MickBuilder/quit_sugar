import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';

part 'sugar_alternative.freezed.dart';

@freezed
abstract class SugarAlternative with _$SugarAlternative {
  const factory SugarAlternative({
    required ProductInfo product, // The alternative product
    required double originalSugar, // Sugar content of original product
    required double alternativeSugar, // Sugar content of alternative
    required double sugarReduction, // Grams of sugar saved
    required double sugarReductionPercent, // Percentage of sugar saved
    required AlternativeRecommendationReason reason, // Why this is recommended
    required double relevanceScore, // How relevant this alternative is (0-1)
    required String swapMessage, // Personalized message for the swap
  }) = _SugarAlternative;

  const SugarAlternative._();

  // Helper getters
  bool get isSignificantImprovement => sugarReductionPercent >= 20; // 20%+ improvement
  bool get isExcellentChoice => sugarReductionPercent >= 50; // 50%+ improvement
  bool get isMarginalImprovement => sugarReductionPercent >= 10 && sugarReductionPercent < 20;
  
  String get improvementLevel {
    if (isExcellentChoice) return 'Excellent';
    if (isSignificantImprovement) return 'Great';
    if (isMarginalImprovement) return 'Good';
    return 'Small';
  }
  
  String get motivationalMessage {
    if (isExcellentChoice) {
      return 'Amazing choice! You\'ll save ${sugarReduction.toStringAsFixed(1)}g of sugar! 🌟';
    } else if (isSignificantImprovement) {
      return 'Great swap! ${sugarReduction.toStringAsFixed(1)}g less sugar! 💪';
    } else if (isMarginalImprovement) {
      return 'Good choice! Every gram counts - save ${sugarReduction.toStringAsFixed(1)}g! 👍';
    } else {
      return 'Small improvement - ${sugarReduction.toStringAsFixed(1)}g saved!';
    }
  }
}

enum AlternativeRecommendationReason {
  lowerSugar, // Simply has less sugar
  sugarFree, // Zero sugar option
  naturalSweetener, // Uses natural sweeteners instead
  smallerPortion, // Same product but smaller serving
  similarCategory, // Similar product type but healthier
  brandAlternative, // Different brand, same category
  dietVersion, // Diet/light version of same product
}

extension AlternativeRecommendationReasonExtension on AlternativeRecommendationReason {
  String get displayName {
    switch (this) {
      case AlternativeRecommendationReason.lowerSugar:
        return 'Lower Sugar';
      case AlternativeRecommendationReason.sugarFree:
        return 'Sugar Free';
      case AlternativeRecommendationReason.naturalSweetener:
        return 'Natural Sweetener';
      case AlternativeRecommendationReason.smallerPortion:
        return 'Smaller Portion';
      case AlternativeRecommendationReason.similarCategory:
        return 'Healthier Option';
      case AlternativeRecommendationReason.brandAlternative:
        return 'Better Brand';
      case AlternativeRecommendationReason.dietVersion:
        return 'Diet Version';
    }
  }
  
  String get description {
    switch (this) {
      case AlternativeRecommendationReason.lowerSugar:
        return 'Contains less sugar than your scanned product';
      case AlternativeRecommendationReason.sugarFree:
        return 'Zero sugar - perfect for your goals!';
      case AlternativeRecommendationReason.naturalSweetener:
        return 'Uses natural sweeteners instead of added sugar';
      case AlternativeRecommendationReason.smallerPortion:
        return 'Same product in a smaller, more controlled portion';
      case AlternativeRecommendationReason.similarCategory:
        return 'Similar product with healthier ingredients';
      case AlternativeRecommendationReason.brandAlternative:
        return 'Different brand with better sugar content';
      case AlternativeRecommendationReason.dietVersion:
        return 'Reduced sugar version of this product';
    }
  }
}

@freezed
abstract class SugarSwapRecommendation with _$SugarSwapRecommendation {
  const factory SugarSwapRecommendation({
    required ProductInfo originalProduct,
    required List<SugarAlternative> alternatives,
    required String recommendationMessage,
    required SugarSwapStrategy strategy,
    required DateTime generatedAt,
  }) = _SugarSwapRecommendation;

  const SugarSwapRecommendation._();

  // Helper getters
  List<SugarAlternative> get topAlternatives => 
      alternatives.take(3).toList(); // Show max 3 alternatives
      
  SugarAlternative? get bestAlternative => 
      alternatives.isNotEmpty ? alternatives.first : null;
      
  double get maxSugarSavings => alternatives.isNotEmpty 
      ? alternatives.map((a) => a.sugarReduction).reduce((a, b) => a > b ? a : b)
      : 0.0;
}

enum SugarSwapStrategy {
  eliminate, // Suggest zero-sugar alternatives
  reduce, // Suggest lower-sugar alternatives
  portion, // Suggest smaller portions
  substitute, // Suggest different category alternatives
}

extension SugarSwapStrategyExtension on SugarSwapStrategy {
  String get displayName {
    switch (this) {
      case SugarSwapStrategy.eliminate:
        return 'Eliminate Sugar';
      case SugarSwapStrategy.reduce:
        return 'Reduce Sugar';
      case SugarSwapStrategy.portion:
        return 'Control Portions';
      case SugarSwapStrategy.substitute:
        return 'Find Substitutes';
    }
  }
}