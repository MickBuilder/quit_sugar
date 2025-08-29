import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/support/domain/entities/withdrawal_symptom.dart';

class SymptomIntensitySelector extends HookConsumerWidget {
  final SymptomType symptomType;
  final int? currentIntensity;
  final ValueChanged<int> onIntensityChanged;

  const SymptomIntensitySelector({
    super.key,
    required this.symptomType,
    this.currentIntensity,
    required this.onIntensityChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIntensity = useState<int?>(currentIntensity);

    // Update when currentIntensity changes
    useEffect(() {
      selectedIntensity.value = currentIntensity;
      return null;
    }, [currentIntensity]);

    return Container(
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
          // Symptom header
          Row(
            children: [
              Text(
                symptomType.icon,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      symptomType.title,
                      style: AppTextStyles.heading.copyWith(
                        fontSize: 18,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      symptomType.description,
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textMuted,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Intensity selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              final intensity = index + 1;
              final isSelected = selectedIntensity.value == intensity;
              
              return GestureDetector(
                onTap: () {
                  selectedIntensity.value = intensity;
                  onIntensityChanged(intensity);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isSelected ? AppTheme.primaryBlack : AppTheme.background,
                    border: Border.all(
                      color: AppTheme.primaryBlack,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: isSelected ? [
                      BoxShadow(
                        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                        blurRadius: 0,
                        offset: const Offset(2, 2),
                      ),
                    ] : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        intensity.toString(),
                        style: TextStyle(
                          color: isSelected ? AppTheme.background : AppTheme.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          
          const SizedBox(height: 8),
          
          // Intensity label
          if (selectedIntensity.value != null)
            Center(
              child: Text(
                symptomType.intensityLabel(selectedIntensity.value!),
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.textMuted,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}