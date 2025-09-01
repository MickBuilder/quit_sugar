import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/domain/services/sugar_swap_service.dart';
import 'package:quit_suggar/features/tracking/domain/entities/sugar_alternative.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';

part 'sugar_swap_provider.g.dart';

/// Provides the sugar swap service
@Riverpod(keepAlive: true)
SugarSwapService sugarSwapService(Ref ref) {
  final trackingRepository = ref.watch(trackingRepositoryProvider);
  return SugarSwapServiceImpl(trackingRepository);
}

/// Gets sugar swap recommendations for a specific product
@riverpod
Future<SugarSwapRecommendation?> sugarSwapRecommendations(
  Ref ref,
  ProductInfo product,
) async {
  final sugarSwapService = ref.watch(sugarSwapServiceProvider);
  return await sugarSwapService.getRecommendationsFor(product);
}

/// Checks if alternatives should be suggested for a product
@riverpod
Future<bool> shouldSuggestAlternatives(
  Ref ref,
  ProductInfo product,
) async {
  final sugarSwapService = ref.watch(sugarSwapServiceProvider);
  final trackingRepository = ref.watch(trackingRepositoryProvider);
  final dailyLimit = await trackingRepository.getDailyLimit();
  return sugarSwapService.shouldSuggestAlternatives(product, dailyLimit);
}

/// Gets the recommended strategy for a product
@riverpod
Future<SugarSwapStrategy> recommendedStrategy(
  Ref ref,
  ProductInfo product,
) async {
  final sugarSwapService = ref.watch(sugarSwapServiceProvider);
  final trackingRepository = ref.watch(trackingRepositoryProvider);
  
  final currentIntake = await trackingRepository.getCurrentSugarIntake();
  final dailyLimit = await trackingRepository.getDailyLimit();
  
  return sugarSwapService.getRecommendedStrategy(product, currentIntake, dailyLimit);
}