import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/tracking_operations_provider.dart';
import 'package:quit_suggar/features/tracking/presentation/widgets/product_details_sheet.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/core/widgets/standardized_widgets.dart';

class EditScannedProductScreen extends AppScreen {
  final FoodEntry entry;

  const EditScannedProductScreen({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double selectedPortion = entry.portionGrams;
    final parentContext = context;

    AppLogger.logUI('Edit scanned product screen opened for: ${entry.displayName}');

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        middle: Text(
          'Edit Product',
          style: AppTextStyles.heading.copyWith(fontSize: 18),
        ),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            AppLogger.logNavigation('Edit scanned product screen closed by back button');
            context.pop();
          },
        ),
      ),
      child: SafeArea(
        child: ProductDetailsSheet(
          product: entry.product,
          selectedPortion: selectedPortion,
          onPortionChanged: (value) {
            selectedPortion = value;
            AppLogger.logUserAction('Adjusted portion size in edit mode', {
              'portion_grams': value,
            });
          },
          onAddToDailyLog: () async {
            AppLogger.logUserAction('Confirmed editing product in daily log', {
              'product_name': entry.product.name,
              'portion_grams': selectedPortion,
            });
            
            // Update the existing entry
            final success = await ref.read(sugarTrackingProvider.notifier).editEntry(
              entry.id,
              portionGrams: selectedPortion,
            );

            if (success && parentContext.mounted) {
              AppLogger.logUI('Product edited successfully');
              context.pop(); // Close the edit screen
            } else {
              AppLogger.logSugarTrackingError('Failed to edit product: ${entry.product.name}');
              if (parentContext.mounted) {
                _showError(parentContext, 'Failed to update product. Please try again.');
              }
            }
          },
        ),
      ),
    );
  }

  void _showError(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Error'),
        content: Text(message),
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
