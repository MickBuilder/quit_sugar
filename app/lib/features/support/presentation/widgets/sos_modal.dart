import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/support/domain/entities/coping_strategy.dart';

class SOSModal extends HookConsumerWidget {
  const SOSModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = useState<CopingStrategyType?>(null);
    final selectedStrategy = useState<CopingStrategy?>(null);

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          child: Icon(
            CupertinoIcons.xmark,
            color: AppTheme.textPrimary,
            size: 24,
          ),
        ),
        middle: Text(
          'Craving SOS',
          style: AppTextStyles.heading.copyWith(fontSize: 20),
        ),
      ),
      child: SafeArea(
        child: selectedStrategy.value != null
            ? _buildStrategyDetail(context, selectedStrategy.value!, () {
                selectedStrategy.value = null;
                selectedType.value = null;
              })
            : selectedType.value != null
                ? _buildStrategyList(selectedType.value!, (strategy) {
                    selectedStrategy.value = strategy;
                  })
                : _buildTypeSelector((type) {
                    selectedType.value = type;
                  }),
      ),
    );
  }

  Widget _buildTypeSelector(ValueChanged<CopingStrategyType> onTypeSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'I need help with...',
            style: AppTextStyles.heading.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 8),
          
          Text(
            'Choose the type of support you need right now',
            style: AppTextStyles.body.copyWith(
              color: AppTheme.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 32),
          
          ...CopingStrategyType.values.map((type) {
            final strategies = CopingStrategies.getByType(type);
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () => onTypeSelected(type),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceBackground,
                    border: Border.all(color: AppTheme.primaryBlack, width: 2),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                        blurRadius: 0,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        type.icon,
                        style: const TextStyle(fontSize: 32),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              type.title,
                              style: AppTextStyles.title,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${strategies.length} strategies available',
                              style: AppTextStyles.body.copyWith(
                                color: AppTheme.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.chevron_right,
                        color: AppTheme.textMuted,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          
          const SizedBox(height: 24),
          
          // Quick strategies section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.successGreen,
              border: Border.all(color: AppTheme.primaryBlack, width: 2),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                  blurRadius: 0,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  '💡 Quick Tip',
                  style: AppTextStyles.title.copyWith(
                    color: AppTheme.primaryWhite,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Remember: Cravings are temporary. They usually pass within 10-15 minutes. You\'ve got this!',
                  style: AppTextStyles.body.copyWith(
                    color: AppTheme.primaryWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStrategyList(CopingStrategyType type, ValueChanged<CopingStrategy> onStrategySelected) {
    final strategies = CopingStrategies.getByType(type);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                type.icon,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 12),
              Text(
                type.title,
                style: AppTextStyles.heading.copyWith(fontSize: 24),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          Text(
            'Choose a strategy that feels right for you now',
            style: AppTextStyles.body.copyWith(
              color: AppTheme.textMuted,
            ),
          ),
          
          const SizedBox(height: 24),
          
          Expanded(
            child: ListView.builder(
              itemCount: strategies.length,
              itemBuilder: (context, index) {
                final strategy = strategies[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () => onStrategySelected(strategy),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceBackground,
                        border: Border.all(color: AppTheme.primaryBlack, width: 2),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                            blurRadius: 0,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  strategy.title,
                                  style: AppTextStyles.title,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  strategy.description,
                                  style: AppTextStyles.body.copyWith(
                                    color: AppTheme.textMuted,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.accentBlue,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '${strategy.durationMinutes} min',
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppTheme.primaryWhite,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            CupertinoIcons.chevron_right,
                            color: AppTheme.textMuted,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStrategyDetail(BuildContext context, CopingStrategy strategy, VoidCallback onBack) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Back button
          Align(
            alignment: Alignment.centerLeft,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: onBack,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    CupertinoIcons.chevron_left,
                    color: AppTheme.textPrimary,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Back',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Strategy title
          Text(
            strategy.title,
            style: AppTextStyles.heading.copyWith(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 8),
          
          // Duration badge
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppTheme.accentBlue,
                border: Border.all(color: AppTheme.primaryBlack, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${strategy.durationMinutes} minutes',
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.primaryWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Description
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceBackground,
              border: Border.all(color: AppTheme.primaryBlack, width: 2),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                  blurRadius: 0,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why this helps:',
                  style: AppTextStyles.title,
                ),
                const SizedBox(height: 8),
                Text(
                  strategy.description,
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Action steps
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.accentGreen,
              border: Border.all(color: AppTheme.primaryBlack, width: 2),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                  blurRadius: 0,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What to do:',
                  style: AppTextStyles.title.copyWith(
                    color: AppTheme.primaryWhite,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  strategy.action,
                  style: AppTextStyles.body.copyWith(
                    color: AppTheme.primaryWhite,
                  ),
                ),
              ],
            ),
          ),
          
          const Spacer(),
          
          // Done button
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.primaryBlack,
              border: Border.all(color: AppTheme.primaryBlack, width: 2),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                  blurRadius: 0,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: CupertinoButton(
              onPressed: () {
                // TODO: Log strategy usage for analytics
                Navigator.pop(context);
              },
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'I\'ve done this! 🎉',
                style: AppTextStyles.button.copyWith(
                  color: AppTheme.primaryWhite,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Encouragement
          Text(
            'Remember: Every craving you overcome makes you stronger. You\'re doing great! 💪',
            style: AppTextStyles.body.copyWith(
              color: AppTheme.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Helper function to show SOS modal
void showSOSModal(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => const SOSModal(),
  );
}