import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/support/domain/entities/withdrawal_symptom.dart';
import 'package:quit_suggar/features/support/presentation/widgets/symptom_intensity_selector.dart';
import 'package:quit_suggar/features/support/presentation/widgets/sos_modal.dart';

class SupportScreen extends HookConsumerWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayLog = useState<DailySymptomLog>(
      DailySymptomLog.forDate(DateTime.now()),
    );

    void updateSymptom(SymptomType type, int intensity) {
      final symptom = WithdrawalSymptom.create(
        type: type,
        intensity: intensity,
      );
      todayLog.value = todayLog.value.updateSymptom(symptom);
    }

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        middle: Text(
          'Support',
          style: AppTextStyles.heading.copyWith(fontSize: 20),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Text(
                'How are you feeling today?',
                style: AppTextStyles.heading.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 8),
              
              Text(
                'Track your withdrawal symptoms to understand your progress',
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.textMuted,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              // Symptom trackers
              ...SymptomType.values.map((type) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SymptomIntensitySelector(
                  symptomType: type,
                  currentIntensity: todayLog.value.getSymptom(type)?.intensity,
                  onIntensityChanged: (intensity) => updateSymptom(type, intensity),
                ),
              )),
              
              const SizedBox(height: 24),
              
              // SOS Button
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.errorRed,
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
                    showSOSModal(context);
                  },
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.heart_fill,
                        color: AppTheme.primaryWhite,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Craving SOS',
                        style: AppTextStyles.button.copyWith(
                          color: AppTheme.primaryWhite,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Progress summary
              if (todayLog.value.symptoms.isNotEmpty)
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
                    children: [
                      Text(
                        'Today\'s Summary',
                        style: AppTextStyles.title,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Symptoms tracked: ${todayLog.value.symptoms.length}/4',
                        style: AppTextStyles.body,
                      ),
                      if (todayLog.value.isComplete)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            '✅ Daily check-in complete',
                            style: AppTextStyles.body.copyWith(
                              color: AppTheme.successGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}