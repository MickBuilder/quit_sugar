import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_alternative.dart';
import 'package:quit_suggar/features/tracking/domain/repositories/tracking_repository.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

abstract class SugarSwapService {
  /// Get sugar swap recommendations for a scanned product
  Future<SugarSwapRecommendation?> getRecommendationsFor(ProductInfo product);
  
  /// Check if a product needs alternatives (high sugar content)
  bool shouldSuggestAlternatives(ProductInfo product, double dailyLimit);
  
  /// Get swap strategy based on user's current progress
  SugarSwapStrategy getRecommendedStrategy(ProductInfo product, double currentIntake, double dailyLimit);
}

class SugarSwapServiceImpl implements SugarSwapService {
  final TrackingRepository _trackingRepository;
  
  // Thresholds for determining if alternatives should be suggested
  static const double _highSugarThresholdGrams = 15.0; // 15g+ per 100g is high
  static const double _dailyLimitPercentageThreshold = 0.25; // 25% of daily limit
  
  SugarSwapServiceImpl(this._trackingRepository);
  
  @override
  Future<SugarSwapRecommendation?> getRecommendationsFor(ProductInfo product) async {
    try {
      AppLogger.logSugarTracking('Generating sugar swap recommendations for ${product.name}');
      
      // Search for alternative products
      final alternatives = await _findAlternatives(product);
      
      if (alternatives.isEmpty) {
        AppLogger.logSugarTracking('No alternatives found for ${product.name}');
        return null;
      }
      
      // Get user's current state for personalized strategy
      final currentIntake = await _trackingRepository.getCurrentSugarIntake();
      final dailyLimit = await _trackingRepository.getDailyLimit();
      
      final strategy = getRecommendedStrategy(product, currentIntake, dailyLimit);
      final message = _generateRecommendationMessage(product, alternatives.first, strategy);
      
      return SugarSwapRecommendation(
        originalProduct: product,
        alternatives: alternatives,
        recommendationMessage: message,
        strategy: strategy,
        generatedAt: DateTime.now(),
      );
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to generate recommendations for ${product.name}',
        e,
        stackTrace,
      );
      return null;
    }
  }
  
  @override
  bool shouldSuggestAlternatives(ProductInfo product, double dailyLimit) {
    final sugarPer100g = product.sugarPer100g ?? 0.0;
    final defaultServingSize = 100.0; // Assume 100g serving if not specified
    final productSugarContent = (sugarPer100g * defaultServingSize) / 100;
    
    // Suggest alternatives if:
    // 1. Product has high sugar content (>10g per 100g)
    // 2. Product represents significant portion of daily limit (>25%)
    // 3. Product has any sugar and user is in elimination mode
    
    return sugarPer100g > _highSugarThresholdGrams ||
           productSugarContent > (dailyLimit * _dailyLimitPercentageThreshold) ||
           (sugarPer100g > 0 && dailyLimit < 5.0); // User in elimination mode
  }
  
  @override
  SugarSwapStrategy getRecommendedStrategy(ProductInfo product, double currentIntake, double dailyLimit) {
    final remainingSugar = dailyLimit - currentIntake;
    final productSugar = ((product.sugarPer100g ?? 0.0) * product.servingSize) / 100;
    
    // If user has very low daily limit (elimination mode)
    if (dailyLimit < 5.0) {
      return SugarSwapStrategy.eliminate;
    }
    
    // If adding this product would exceed daily limit
    if (productSugar > remainingSugar) {
      return SugarSwapStrategy.reduce;
    }
    
    // If user is close to limit but product would fit
    if (remainingSugar < dailyLimit * 0.3) {
      return SugarSwapStrategy.portion;
    }
    
    // Default to finding better alternatives
    return SugarSwapStrategy.substitute;
  }
  
  /// Find alternative products with lower sugar content
  Future<List<SugarAlternative>> _findAlternatives(ProductInfo originalProduct) async {
    try {
      // Search for similar products using keywords from product name
      final searchTerms = _extractSearchTerms(originalProduct.name);
      final searchResults = <ProductInfo>[];
      
      // Search using different strategies
      for (final term in searchTerms) {
        final results = await _trackingRepository.searchProducts(term);
        searchResults.addAll(results);
      }
      
      // Also search by category if available
      if (originalProduct.categories.isNotEmpty) {
        final categorySearch = await _trackingRepository.searchProducts(
          originalProduct.categories.first,
        );
        searchResults.addAll(categorySearch);
      }
      
      // Remove duplicates and original product
      final uniqueResults = _removeDuplicates(searchResults);
      uniqueResults.removeWhere((p) => p.barcode == originalProduct.barcode);
      
      // Convert to alternatives and rank them
      final alternatives = _createAlternatives(originalProduct, uniqueResults);
      
      // Sort by relevance score (best alternatives first)
      alternatives.sort((a, b) => b.relevanceScore.compareTo(a.relevanceScore));
      
      return alternatives.take(5).toList(); // Return top 5 alternatives
      
    } catch (e, stackTrace) {
      AppLogger.logSugarTrackingError(
        'Failed to find alternatives for ${originalProduct.name}',
        e,
        stackTrace,
      );
      return [];
    }
  }
  
  /// Extract search terms from product name
  List<String> _extractSearchTerms(String productName) {
    final terms = <String>[];
    final cleanName = productName.toLowerCase();
    
    // Common food categories to search for
    final categories = [
      'yogurt', 'milk', 'cereal', 'juice', 'soda', 'candy', 'chocolate',
      'cookie', 'cake', 'bread', 'sauce', 'dressing', 'beverage', 'snack'
    ];
    
    // Find matching categories
    for (final category in categories) {
      if (cleanName.contains(category)) {
        terms.add(category);
      }
    }
    
    // Extract brand name (usually first word)
    final words = cleanName.split(' ');
    if (words.isNotEmpty && words.first.length > 2) {
      terms.add(words.first);
    }
    
    // Extract key descriptive words
    final descriptiveWords = words.where((word) => 
      word.length > 3 && 
      !_isCommonWord(word) &&
      !word.contains(RegExp(r'[0-9]'))
    ).take(2);
    
    terms.addAll(descriptiveWords);
    
    return terms.isEmpty ? [productName.split(' ').first] : terms;
  }
  
  bool _isCommonWord(String word) {
    final commonWords = {
      'with', 'and', 'the', 'for', 'pack', 'size', 'from', 'made', 'natural'
    };
    return commonWords.contains(word.toLowerCase());
  }
  
  /// Remove duplicate products based on barcode and name similarity
  List<ProductInfo> _removeDuplicates(List<ProductInfo> products) {
    final seen = <String>{};
    final unique = <ProductInfo>[];
    
    for (final product in products) {
      final key = product.barcode.isNotEmpty 
          ? product.barcode 
          : product.name.toLowerCase().replaceAll(' ', '');
      
      if (!seen.contains(key)) {
        seen.add(key);
        unique.add(product);
      }
    }
    
    return unique;
  }
  
  /// Create SugarAlternative objects from search results
  List<SugarAlternative> _createAlternatives(
    ProductInfo original, 
    List<ProductInfo> candidates,
  ) {
    final alternatives = <SugarAlternative>[];
    // Use per 100g consistently to avoid serving size discrepancies
    final originalSugarPer100g = original.sugarPer100g ?? 0.0;
    
    for (final candidate in candidates) {
      final candidateSugarPer100g = candidate.sugarPer100g ?? 0.0;
      
      // Only include products with less sugar (per 100g comparison)
      if (candidateSugarPer100g >= originalSugarPer100g) continue;
      
      final sugarReduction = originalSugarPer100g - candidateSugarPer100g;
      final reductionPercent = (sugarReduction / originalSugarPer100g) * 100;
      
      // Skip alternatives with less than 5% improvement
      if (reductionPercent < 5.0) continue;
      
      final reason = _determineRecommendationReason(original, candidate);
      final relevanceScore = _calculateRelevanceScore(original, candidate);
      final swapMessage = _generateSwapMessage(original, candidate, reason);
      
      alternatives.add(SugarAlternative(
        product: candidate,
        originalSugar: originalSugarPer100g,
        alternativeSugar: candidateSugarPer100g,
        sugarReduction: sugarReduction,
        sugarReductionPercent: reductionPercent,
        reason: reason,
        relevanceScore: relevanceScore,
        swapMessage: swapMessage,
      ));
    }
    
    return alternatives;
  }
  
  /// Determine why this alternative is being recommended
  AlternativeRecommendationReason _determineRecommendationReason(
    ProductInfo original, 
    ProductInfo alternative,
  ) {
    final altSugar = ((alternative.sugarPer100g ?? 0.0) * alternative.servingSize) / 100;
    
    // Zero sugar
    if (altSugar == 0) {
      return AlternativeRecommendationReason.sugarFree;
    }
    
    // Diet version detection
    if (alternative.name.toLowerCase().contains('diet') ||
        alternative.name.toLowerCase().contains('light') ||
        alternative.name.toLowerCase().contains('zero')) {
      return AlternativeRecommendationReason.dietVersion;
    }
    
    // Natural sweetener detection
    if (alternative.name.toLowerCase().contains('stevia') ||
        alternative.name.toLowerCase().contains('monk fruit') ||
        alternative.name.toLowerCase().contains('natural')) {
      return AlternativeRecommendationReason.naturalSweetener;
    }
    
    // Smaller portion
    if (alternative.servingSize < original.servingSize * 0.8) {
      return AlternativeRecommendationReason.smallerPortion;
    }
    
    // Brand alternative (different brand, similar product)
    final originalBrand = original.name.split(' ').first.toLowerCase();
    final altBrand = alternative.name.split(' ').first.toLowerCase();
    if (originalBrand != altBrand && _areSimilarProducts(original, alternative)) {
      return AlternativeRecommendationReason.brandAlternative;
    }
    
    // Default to lower sugar
    return AlternativeRecommendationReason.lowerSugar;
  }
  
  /// Calculate how relevant/similar this alternative is to the original
  double _calculateRelevanceScore(ProductInfo original, ProductInfo alternative) {
    double score = 0.0;
    
    // Name similarity (0-0.3)
    final nameSimilarity = _calculateStringSimilarity(
      original.name.toLowerCase(), 
      alternative.name.toLowerCase(),
    );
    score += nameSimilarity * 0.3;
    
    // Category similarity (0-0.2)
    final categoryMatch = original.categories.any((cat) =>
      alternative.categories.any((altCat) => cat == altCat));
    if (categoryMatch) score += 0.2;
    
    // Sugar reduction benefit (0-0.3)
    final originalSugar = ((original.sugarPer100g ?? 0.0) * original.servingSize) / 100;
    final altSugar = ((alternative.sugarPer100g ?? 0.0) * alternative.servingSize) / 100;
    final reductionPercent = ((originalSugar - altSugar) / originalSugar).clamp(0.0, 1.0);
    score += reductionPercent * 0.3;
    
    // Nutrition quality (0-0.2)
    // Prefer products with some nutritional data
    if (alternative.categories.isNotEmpty) score += 0.1;
    if (alternative.servingSize > 0) score += 0.1;
    
    return score.clamp(0.0, 1.0);
  }
  
  /// Calculate string similarity between two strings
  double _calculateStringSimilarity(String s1, String s2) {
    if (s1 == s2) return 1.0;
    if (s1.isEmpty || s2.isEmpty) return 0.0;
    
    final words1 = s1.split(' ');
    final words2 = s2.split(' ');
    
    int commonWords = 0;
    for (final word1 in words1) {
      if (words2.any((word2) => word2.contains(word1) || word1.contains(word2))) {
        commonWords++;
      }
    }
    
    return commonWords / (words1.length + words2.length - commonWords);
  }
  
  /// Check if two products are similar types
  bool _areSimilarProducts(ProductInfo p1, ProductInfo p2) {
    // Check if they share any categories
    return p1.categories.any((cat) => p2.categories.contains(cat));
  }
  
  /// Generate a personalized swap message
  String _generateSwapMessage(
    ProductInfo original, 
    ProductInfo alternative, 
    AlternativeRecommendationReason reason,
  ) {
    final altSugar = ((alternative.sugarPer100g ?? 0.0) * alternative.servingSize) / 100;
    final originalSugar = ((original.sugarPer100g ?? 0.0) * original.servingSize) / 100;
    final savings = originalSugar - altSugar;
    
    switch (reason) {
      case AlternativeRecommendationReason.sugarFree:
        return 'Go sugar-free with ${alternative.name}! Save ${savings.toStringAsFixed(1)}g';
      case AlternativeRecommendationReason.dietVersion:
        return 'Try the diet version! ${alternative.name} has ${savings.toStringAsFixed(1)}g less sugar';
      case AlternativeRecommendationReason.naturalSweetener:
        return 'Natural sweetness! ${alternative.name} saves ${savings.toStringAsFixed(1)}g sugar';
      case AlternativeRecommendationReason.smallerPortion:
        return 'Portion control! Smaller ${alternative.name} saves ${savings.toStringAsFixed(1)}g';
      case AlternativeRecommendationReason.brandAlternative:
        return 'Better brand choice! ${alternative.name} has ${savings.toStringAsFixed(1)}g less sugar';
      default:
        return 'Healthier choice! ${alternative.name} saves ${savings.toStringAsFixed(1)}g sugar';
    }
  }
  
  /// Generate main recommendation message for the whole suggestion
  String _generateRecommendationMessage(
    ProductInfo original,
    SugarAlternative bestAlternative,
    SugarSwapStrategy strategy,
  ) {
    final productSugar = ((original.sugarPer100g ?? 0.0) * original.servingSize) / 100;
    
    switch (strategy) {
      case SugarSwapStrategy.eliminate:
        return 'This product has ${productSugar.toStringAsFixed(1)}g of sugar. Since you\'re aiming to eliminate sugar, here are some zero-sugar alternatives:';
      case SugarSwapStrategy.reduce:
        return 'This would use up a lot of your daily sugar budget! Here are some lower-sugar options:';
      case SugarSwapStrategy.portion:
        return 'You\'re getting close to your daily limit. Consider these smaller portions or alternatives:';
      case SugarSwapStrategy.substitute:
        return 'Great choice for tracking! Here are some even healthier alternatives you might like:';
    }
  }
}