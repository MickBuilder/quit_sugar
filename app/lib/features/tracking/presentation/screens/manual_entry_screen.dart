import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class ManualEntryScreen extends HookConsumerWidget {
  const ManualEntryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodNameController = useTextEditingController();
    final sugarAmountController = useTextEditingController();
    final isLoading = useState(false);

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        leading: Row(
          children: [
            CupertinoNavigationBarBackButton(
              onPressed: () {
                AppLogger.logNavigation('Manual entry screen closed by back button');
                context.pop();
              },
            ),
            const SizedBox(width: 8),
            Text(
              'Manual Entry',
              style: AppTextStyles.heading.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),

              // Header
              Text(
                'Add Manual Sugar Entry',
                style: AppTextStyles.heading.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 8),
              Text(
                'For sugar intake not from scanned products or photos',
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.textMuted,
                ),
              ),

              const SizedBox(height: 32),

              // Food name input
              _buildInputField(
                controller: foodNameController,
                label: 'Description',
                placeholder: 'e.g., Coffee with sugar, Birthday cake slice',
                icon: CupertinoIcons.tag,
              ),

              const SizedBox(height: 20),

              // Sugar amount input
              _buildInputField(
                controller: sugarAmountController,
                label: 'Total Sugar (grams)',
                placeholder: 'e.g., 12.5',
                icon: CupertinoIcons.chart_bar,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 32),

              // Add button
              SizedBox(
                height: 56,
                child: CupertinoButton(
                  color: AppTheme.primaryBlack,
                  borderRadius: BorderRadius.circular(8),
                  onPressed: isLoading.value
                      ? null
                      : () async {
                          await _addManualEntry(
                            context,
                            ref,
                            foodNameController.text,
                            sugarAmountController.text,
                            isLoading,
                          );
                        },
                  child: isLoading.value
                      ? const CupertinoActivityIndicator(
                          color: AppTheme.primaryWhite,
                        )
                      : Text(
                          'Add to Daily Log',
                          style: AppTextStyles.heading.copyWith(
                            color: AppTheme.primaryWhite,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 32),

              // Tips section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlack.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.borderDefault,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.lightbulb,
                          color: AppTheme.primaryBlack,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Quick Tips',
                          style: AppTextStyles.heading.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '• 1 teaspoon of sugar = ~4 grams\n'
                      '• 1 tablespoon of sugar = ~12 grams\n'
                      '• Check nutrition labels for total sugar\n'
                      '• Include both added and natural sugars\n'
                      '• Be honest for accurate tracking',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textMuted,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String placeholder,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.heading.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.primaryWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppTheme.borderDefault,
              width: 1,
            ),
          ),
          child: CupertinoTextField(
            controller: controller,
            placeholder: placeholder,
            keyboardType: keyboardType,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: null,
            style: AppTextStyles.body,
            placeholderStyle: AppTextStyles.body.copyWith(
              color: AppTheme.textMuted,
            ),
            prefix: Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Icon(
                icon,
                color: AppTheme.textMuted,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _addManualEntry(
    BuildContext context,
    WidgetRef ref,
    String foodName,
    String sugarAmountText,
    ValueNotifier<bool> isLoading,
  ) async {
    // Validate inputs
    if (foodName.trim().isEmpty) {
      _showError(context, 'Please enter a food or drink name');
      return;
    }

    final sugarAmount = double.tryParse(sugarAmountText);
    if (sugarAmount == null || sugarAmount <= 0) {
      _showError(context, 'Please enter a valid sugar amount');
      return;
    }
    
    if (sugarAmount > 200) {
      _showError(context, 'Sugar amount seems too high. Please check and try again.');
      return;
    }

    isLoading.value = true;

    try {
      AppLogger.logUserAction('Add manual entry', {
        'food_name': foodName,
        'sugar_amount': sugarAmount,
      });

      final success = await ref.read(sugarTrackingProvider.notifier).addManualEntry(
        foodName.trim(),
        sugarAmount,
      );

      if (success && context.mounted) {
        AppLogger.logUI('Manual entry added successfully');
        context.pop();
      } else {
        if (context.mounted) {
          _showError(context, 'Failed to add entry. Please try again.');
        }
      }
    } catch (e) {
      AppLogger.logSugarTrackingError('Error adding manual entry: $e');
      if (context.mounted) {
        _showError(context, 'An error occurred. Please try again.');
      }
    } finally {
      isLoading.value = false;
    }
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
