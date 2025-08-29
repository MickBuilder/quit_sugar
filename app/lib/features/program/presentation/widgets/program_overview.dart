import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/program/presentation/providers/program_provider.dart';
import 'package:quit_suggar/features/onboarding/domain/entities/program_phase.dart';

class ProgramOverview extends HookConsumerWidget {
  const ProgramOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programProgressAsync = ref.watch(programProgressProvider);

    return programProgressAsync.when(
      data: (programState) {
        if (!programState.isActive) {
          return _buildNotStartedCard();
        }
        
        return Column(
          children: [
            _buildCurrentProgressCard(programState),
            const SizedBox(height: 16),
            _buildPhaseCard(programState),
          ],
        );
      },
      loading: () => _buildLoadingCard(),
      error: (error, stack) => _buildErrorCard(),
    );
  }

  Widget _buildCurrentProgressCard(ProgramProgressState state) {
    return Container(
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Day ${state.currentDay}',
                style: AppTextStyles.heading.copyWith(fontSize: 32),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.accentBlue,
                  border: Border.all(color: AppTheme.primaryBlack, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Week ${state.currentWeek}',
                  style: AppTextStyles.body.copyWith(
                    color: AppTheme.primaryWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Progress bar
          Container(
            height: 12,
            decoration: BoxDecoration(
              color: AppTheme.background,
              border: Border.all(color: AppTheme.primaryBlack, width: 2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: state.progressPercentage,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.accentGreen,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(state.progressPercentage * 100).toStringAsFixed(1)}% Complete',
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${state.daysLeftTotal} days left',
                style: AppTextStyles.body.copyWith(
                  color: AppTheme.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Daily limit
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.accentOrange,
              border: Border.all(color: AppTheme.primaryBlack, width: 2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.circle_filled,
                  color: AppTheme.primaryWhite,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Today\'s Limit: ${state.currentDailyLimit.toStringAsFixed(1)}g',
                  style: AppTextStyles.title.copyWith(
                    color: AppTheme.primaryWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseCard(ProgramProgressState state) {
    if (state.currentPhase == null) return const SizedBox.shrink();
    
    final phase = state.currentPhase!;
    
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _getPhaseColor(phase),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                phase.title,
                style: AppTextStyles.heading.copyWith(fontSize: 20),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          Text(
            state.phaseDescription,
            style: AppTextStyles.body.copyWith(
              color: AppTheme.textMuted,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    border: Border.all(color: AppTheme.primaryBlack, width: 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${state.daysInCurrentPhase}',
                        style: AppTextStyles.title.copyWith(
                          color: _getPhaseColor(phase),
                        ),
                      ),
                      Text(
                        'Days in phase',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    border: Border.all(color: AppTheme.primaryBlack, width: 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${state.daysLeftInCurrentPhase}',
                        style: AppTextStyles.title.copyWith(
                          color: AppTheme.textMuted,
                        ),
                      ),
                      Text(
                        'Days left',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // Show milestone celebration indicator
          if (state.isWeekEnd || state.isMajorMilestone)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.starFilled,
                  border: Border.all(color: AppTheme.primaryBlack, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('🎉', style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 8),
                    Text(
                      state.isMajorMilestone 
                          ? 'Major Milestone Reached!'
                          : 'Week ${state.currentWeek} Complete!',
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotStartedCard() {
    return Container(
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
      child: Column(
        children: [
          const Icon(
            CupertinoIcons.play_circle,
            color: AppTheme.textMuted,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            'Program Not Started',
            style: AppTextStyles.heading,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Complete your onboarding to start your 60-day sugar-free journey',
            style: AppTextStyles.body.copyWith(
              color: AppTheme.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingCard() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppTheme.surfaceBackground,
        border: Border.all(color: AppTheme.primaryBlack, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: CupertinoActivityIndicator(radius: 20),
      ),
    );
  }

  Widget _buildErrorCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceBackground,
        border: Border.all(color: AppTheme.errorRed, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_triangle,
            color: AppTheme.errorRed,
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            'Unable to load program progress',
            style: AppTextStyles.body.copyWith(
              color: AppTheme.errorRed,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _getPhaseColor(phase) {
    switch (phase) {
      case ProgramPhase.initialReduction:
        return AppTheme.accentOrange;
      case ProgramPhase.deepElimination:
        return AppTheme.accentBlue;
      case ProgramPhase.zeroSugar:
        return AppTheme.accentGreen;
      default:
        return AppTheme.textMuted;
    }
  }
}