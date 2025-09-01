import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/subscription/presentation/providers/subscription_provider.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/features/subscription/data/datasources/revenuecat_api_service.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatPaywallScreen extends ConsumerStatefulWidget {
  final String? source;

  const RevenueCatPaywallScreen({super.key, this.source});

  @override
  ConsumerState<RevenueCatPaywallScreen> createState() => _RevenueCatPaywallScreenState();
}

class _RevenueCatPaywallScreenState extends ConsumerState<RevenueCatPaywallScreen> {
  List<StoreProduct>? _products;
  bool _isLoading = true;
  String? _error;
  late final RevenueCatApiService _revenueCatService;

  @override
  void initState() {
    super.initState();
    _revenueCatService = RevenueCatApiService();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Initialize RevenueCat first
      final initialized = await _revenueCatService.initialize();
      if (!initialized) {
        setState(() {
          _error = 'Failed to initialize RevenueCat';
          _isLoading = false;
        });
        return;
      }

      // Get available products from RevenueCat
      final offerings = await Purchases.getOfferings();
      final currentOffering = offerings.current;
      
      if (currentOffering != null && currentOffering.availablePackages.isNotEmpty) {
        setState(() {
          _products = currentOffering.availablePackages
              .map((package) => package.storeProduct)
              .toList();
          _isLoading = false;
        });
        
        AppLogger.logState('Loaded ${_products!.length} products from RevenueCat');
      } else {
        setState(() {
          _error = 'No products available';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to load products: $e';
        _isLoading = false;
      });
      AppLogger.logSugarTrackingError('Failed to load RevenueCat products', e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      child: SafeArea(
        child: Column(
          children: [
            // Header with close button and restore
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'Restore',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textMuted,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () => _restorePurchases(context, ref),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      CupertinoIcons.xmark,
                      color: AppTheme.textMuted,
                      size: 24,
                    ),
                    onPressed: () {
                      AppLogger.logUserAction('RevenueCat paywall closed', {
                        'source': widget.source,
                      });
                      context.pop(false);
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      
                      // Logo
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryWhite,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.primaryBlack,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryBlack.withValues(alpha: 0.2),
                              blurRadius: 0,
                              offset: const Offset(3, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/icon/app-icon.png',
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Main title
                      Text(
                        'Break your sugar addiction and transform your life in 30 days.',
                        style: AppTextStyles.title.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.textPrimary,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Subtitle
                      Text(
                        'Get full access to Quit Sugar including unlimited product scanning, personalized meal plans, daily habit tracking + much more!',
                        style: AppTextStyles.body.copyWith(
                          fontSize: 16,
                          color: AppTheme.textMuted,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // App screenshot mockups placeholder
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppTheme.neutralLightGrey,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppTheme.primaryBlack,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryBlack.withValues(alpha: 0.2),
                              blurRadius: 0,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.device_phone_portrait,
                              size: 48,
                              color: AppTheme.textMuted,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'App Preview Screenshots',
                              style: AppTextStyles.body.copyWith(
                                color: AppTheme.textMuted,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Sugar tracking • Meal plans • Progress charts',
                              style: AppTextStyles.caption.copyWith(
                                color: AppTheme.textMuted,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Pricing cards - Dynamic from RevenueCat
                      if (_isLoading)
                        const Center(
                          child: CupertinoActivityIndicator(radius: 20),
                        )
                      else if (_error != null)
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppTheme.errorRed.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.errorRed, width: 2),
                          ),
                          child: Text(
                            'Error loading pricing: $_error',
                            style: AppTextStyles.body.copyWith(
                              color: AppTheme.errorRed,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      else if (_products != null && _products!.isNotEmpty)
                        _buildPricingCards()
                      else
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppTheme.textMuted.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.textMuted, width: 2),
                          ),
                          child: Text(
                            'No pricing options available',
                            style: AppTextStyles.body.copyWith(
                              color: AppTheme.textMuted,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      
                      const SizedBox(height: 32),
                      
                      // CTA Button
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlack,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.primaryBlack,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                              blurRadius: 0,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          borderRadius: BorderRadius.circular(8),
                          child: Text(
                            'Start My Sugar-Free Journey',
                            style: AppTextStyles.heading.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.primaryWhite,
                            ),
                          ),
                          onPressed: () => _showRevenueCatPaywall(context, ref),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Money back guarantee
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.shield_fill,
                            size: 16,
                            color: AppTheme.textMuted,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '30-Day Money-Back Guarantee',
                            style: AppTextStyles.body.copyWith(
                              fontSize: 14,
                              color: AppTheme.textMuted,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Terms and privacy
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Terms of Use',
                            style: AppTextStyles.body.copyWith(
                              fontSize: 12,
                              color: AppTheme.textMuted,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Text(
                            'Privacy Policy',
                            style: AppTextStyles.body.copyWith(
                              fontSize: 12,
                              color: AppTheme.textMuted,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingCards() {
    if (_products == null || _products!.isEmpty) {
      return Container();
    }

    // Sort products by price (lowest first)
    final sortedProducts = List<StoreProduct>.from(_products!);
    sortedProducts.sort((a, b) => a.price.compareTo(b.price));

    // If we have multiple products, show them in a row
    if (sortedProducts.length >= 2) {
      return Row(
        children: [
          // First product (usually monthly)
          Expanded(
            child: _buildProductCard(sortedProducts[0], false),
          ),
          const SizedBox(width: 16),
          // Second product (usually yearly) - highlighted
          Expanded(
            child: _buildProductCard(sortedProducts[1], true),
          ),
        ],
      );
    } else {
      // Single product
      return _buildProductCard(sortedProducts[0], true);
    }
  }

  Widget _buildProductCard(StoreProduct product, bool isHighlighted) {
    final isYearly = product.identifier.toLowerCase().contains('year') ||
                     product.identifier.toLowerCase().contains('annual');
    
    final backgroundColor = isHighlighted ? AppTheme.accentOrange : AppTheme.surfaceBackground;
    final textColor = isHighlighted ? AppTheme.primaryWhite : AppTheme.textPrimary;
    final mutedTextColor = isHighlighted ? AppTheme.primaryWhite.withValues(alpha: 0.8) : AppTheme.textMuted;

    return GestureDetector(
      onTap: () => _purchaseProduct(product),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.primaryBlack,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryBlack.withValues(alpha: isHighlighted ? 0.3 : 0.1),
              blurRadius: 0,
              offset: Offset(isHighlighted ? 4 : 2, isHighlighted ? 4 : 2),
            ),
          ],
        ),
        child: Column(
          children: [
            if (isHighlighted && isYearly) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlack,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'BEST VALUE',
                  style: AppTextStyles.body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryWhite,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
            Text(
              isYearly ? 'YEARLY' : 'MONTHLY',
              style: AppTextStyles.body.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: mutedTextColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.priceString,
              style: AppTextStyles.title.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Text(
              isYearly ? '/year' : '/month',
              style: AppTextStyles.body.copyWith(
                fontSize: 14,
                color: mutedTextColor,
              ),
            ),
            if (isYearly) ...[
              const SizedBox(height: 8),
              Text(
                'Just ${(product.price / 12).toStringAsFixed(2)} per month!',
                style: AppTextStyles.body.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _purchaseProduct(StoreProduct product) async {
    try {
      AppLogger.logUserAction('Attempting to purchase product: ${product.identifier}');
      
      // Ensure RevenueCat is initialized
      final initialized = await _revenueCatService.initialize();
      if (!initialized) {
        throw Exception('RevenueCat not initialized');
      }
      
      // Use RevenueCat to purchase the product
      final offerings = await Purchases.getOfferings();
      final currentOffering = offerings.current;
      
      if (currentOffering != null) {
        final package = currentOffering.availablePackages.firstWhere(
          (pkg) => pkg.storeProduct.identifier == product.identifier,
          orElse: () => currentOffering.availablePackages.first,
        );
        
        final purchaseResult = await Purchases.purchasePackage(package);
        
        if (purchaseResult.customerInfo.entitlements.all['premium']?.isActive == true) {
          AppLogger.logUserAction('Purchase successful');
          if (mounted) {
            context.go('/dashboard');
          }
        } else {
          AppLogger.logUserAction('Purchase completed but no active entitlement');
        }
      }
    } catch (e) {
      AppLogger.logSugarTrackingError('Purchase failed', e);
      if (mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Purchase Error'),
            content: Text('Failed to complete purchase: $e'),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<void> _showRevenueCatPaywall(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final purchased = await ref.read(subscriptionProvider.notifier).showPaywall();

      if (purchased && context.mounted) {
        context.go('/dashboard');

        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Welcome to Premium!'),
            content: const Text(
              'You now have unlimited access to all features. Thank you for supporting your sugar-free journey!',
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('Continue'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Purchase Error'),
            content: const Text(
              'There was an issue processing your purchase. Please try again.',
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<void> _restorePurchases(BuildContext context, WidgetRef ref) async {
    try {
      final restored = await ref.read(subscriptionProvider.notifier).restorePurchases();

      if (context.mounted) {
        if (restored) {
          context.go('/dashboard');

          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text('Purchases Restored'),
              content: const Text(
                'Your premium subscription has been restored.',
              ),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Continue'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        } else {
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text('No Purchases Found'),
              content: const Text(
                'No previous purchases were found to restore.',
              ),
              actions: [
                CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Restore Error'),
            content: const Text(
              'There was an issue restoring your purchases. Please try again.',
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    }
  }
}