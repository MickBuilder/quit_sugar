import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';

class AnalysisResultsScreen extends HookConsumerWidget {
  const AnalysisResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingData = ref.watch(onboardingFlowProvider);
    final analysisResults = _calculateAnalysisResults(onboardingData);

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    
                    // Title
                    Text(
                      'Your Sugar Addiction\nProfile',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      'Based on your assessment, here\'s your personalized analysis',
                      style: AppTextStyles.body.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Addiction severity card
                    _buildAddictionSeverityCard(analysisResults),
                    
                    const SizedBox(height: 24),
                    
                    // WHO comparison card
                    _buildWHOComparisonCard(analysisResults),
                    
                    const SizedBox(height: 24),
                    
                    // Key insights
                    _buildKeyInsights(analysisResults),
                    
                    const SizedBox(height: 24),
                    
                    // Recovery potential message
                    _buildRecoveryMessage(analysisResults),
                  ],
                ),
              ),
            ),
            
            // Continue button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildContinueButton(context, ref, analysisResults),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> _calculateAnalysisResults(dynamic onboardingData) {
    final currentSugar = onboardingData.currentDailySugar;
    final whoLimit = 25.0;
    final analysisResults = onboardingData.analysisResults;
    
    // Calculate addiction score (0-24 from addiction indicators + 0-16 from lifestyle = max 40)
    final addictionScore = (analysisResults['addictionScore'] ?? 0) + 
                          (analysisResults['sleepQuality'] ?? 0) + 
                          (analysisResults['stressLevels'] ?? 0) +
                          (analysisResults['socialEnvironment'] ?? 0);
    
    // Calculate percentage above WHO limit
    final percentageAbove = currentSugar <= whoLimit 
        ? 0.0
        : ((currentSugar - whoLimit) / whoLimit * 100);
    
    // Determine addiction severity
    String addictionLevel;
    Color addictionColor;
    String addictionDescription;
    
    if (addictionScore <= 10) {
      addictionLevel = 'Mild Dependency';
      addictionColor = AppTheme.progressGreen;
      addictionDescription = 'You have some sugar habits but they\'re manageable';
    } else if (addictionScore <= 20) {
      addictionLevel = 'Moderate Addiction';
      addictionColor = AppTheme.progressYellow;
      addictionDescription = 'You have developed concerning sugar dependency patterns';
    } else if (addictionScore <= 30) {
      addictionLevel = 'Severe Addiction';
      addictionColor = AppTheme.progressRed;
      addictionDescription = 'Sugar significantly impacts your daily life and wellbeing';
    } else {
      addictionLevel = 'Extreme Addiction';
      addictionColor = AppTheme.errorRed;
      addictionDescription = 'You experience severe sugar dependency with major health impacts';
    }
    
    // Sugar consumption status
    String sugarStatus;
    Color sugarColor;
    
    if (currentSugar <= whoLimit) {
      sugarStatus = 'Within WHO Guidelines';
      sugarColor = AppTheme.progressGreen;
    } else if (currentSugar <= whoLimit * 2) {
      sugarStatus = 'Above Healthy Limit';
      sugarColor = AppTheme.progressYellow;
    } else if (currentSugar <= whoLimit * 3) {
      sugarStatus = 'Dangerously High';
      sugarColor = AppTheme.progressRed;
    } else {
      sugarStatus = 'Extremely High Risk';
      sugarColor = AppTheme.errorRed;
    }
    
    return {
      'currentSugar': currentSugar,
      'whoLimit': whoLimit,
      'percentageAbove': percentageAbove,
      'addictionScore': addictionScore,
      'addictionLevel': addictionLevel,
      'addictionColor': addictionColor,
      'addictionDescription': addictionDescription,
      'sugarStatus': sugarStatus,
      'sugarColor': sugarColor,
      'analysisData': analysisResults,
    };
  }


  Widget _buildAddictionSeverityCard(Map<String, dynamic> results) {
    final addictionColor = results['addictionColor'] as Color;
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.primaryBlack,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlack.withValues(alpha: 0.8),
            blurRadius: 0,
            offset: const Offset(6, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // Addiction level badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: addictionColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.primaryBlack, width: 2),
            ),
            child: Text(
              results['addictionLevel'],
              style: AppTextStyles.body.copyWith(
                color: AppTheme.primaryWhite,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Addiction Severity Level',
            style: AppTextStyles.title.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 12),
          
          Text(
            results['addictionDescription'],
            style: AppTextStyles.body.copyWith(
              color: AppTheme.textMuted,
              fontSize: 16,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          // Addiction score visualization
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: addictionColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: addictionColor, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Assessment Score: ',
                  style: AppTextStyles.body.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
                Text(
                  '${results['addictionScore']}/40',
                  style: AppTextStyles.body.copyWith(
                    color: addictionColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWHOComparisonCard(Map<String, dynamic> results) {
    final sugarColor = results['sugarColor'] as Color;
    final percentageAbove = results['percentageAbove'] as double;
    final currentSugar = results['currentSugar'] as double;
    final whoLimit = results['whoLimit'] as double;
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.primaryBlack,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlack.withValues(alpha: 0.8),
            blurRadius: 0,
            offset: const Offset(6, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'WHO Comparison',
            style: AppTextStyles.title.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          
          const SizedBox(height: 16),
          
          if (percentageAbove <= 0) ...[
            Text(
              'Congratulations! 🎉',
              style: AppTextStyles.body.copyWith(
                fontSize: 18,
                color: sugarColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You\'re within WHO healthy guidelines',
              style: AppTextStyles.body.copyWith(
                color: AppTheme.textMuted,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ] else ...[
            Text(
              'You consume',
              style: AppTextStyles.body.copyWith(
                fontSize: 16,
                color: AppTheme.textMuted,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  percentageAbove.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: sugarColor,
                  ),
                ),
                Text(
                  '%',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: sugarColor,
                  ),
                ),
              ],
            ),
            Text(
              'more sugar than recommended',
              style: AppTextStyles.body.copyWith(
                fontSize: 16,
                color: sugarColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          
          const SizedBox(height: 20),
          
          // Sugar intake breakdown
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.primaryBlack, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Your Intake',
                      style: AppTextStyles.caption.copyWith(
                        color: AppTheme.textMuted,
                      ),
                    ),
                    Text(
                      '${currentSugar.toStringAsFixed(1)}g',
                      style: AppTextStyles.title.copyWith(
                        color: sugarColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: AppTheme.primaryBlack,
                ),
                Column(
                  children: [
                    Text(
                      'WHO Limit',
                      style: AppTextStyles.caption.copyWith(
                        color: AppTheme.textMuted,
                      ),
                    ),
                    Text(
                      '${whoLimit.toStringAsFixed(0)}g',
                      style: AppTextStyles.title.copyWith(
                        color: AppTheme.progressGreen,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyInsights(Map<String, dynamic> results) {
    final analysisData = results['analysisData'] as Map<String, dynamic>;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryBlack, width: 2),
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
            'Key Insights',
            style: AppTextStyles.title.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          
          const SizedBox(height: 16),
          
          _buildInsightItem(
            '🧠',
            'Craving Level: ${_getCravingLevel(analysisData['cravingIntensity'] ?? 0)}',
          ),
          
          _buildInsightItem(
            '⚡',
            'Energy Impact: ${_getEnergyImpact(analysisData['energyImpact'] ?? 0)}',
          ),
          
          _buildInsightItem(
            '😊',
            'Mood Dependency: ${_getMoodImpact(analysisData['moodImpact'] ?? 0)}',
          ),
          
          _buildInsightItem(
            '😰',
            'Stress Response: ${_getStressResponse(analysisData['stressEating'] ?? 0)}',
          ),
        ],
      ),
    );
  }

  Widget _buildInsightItem(String icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body.copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecoveryMessage(Map<String, dynamic> results) {
    final addictionLevel = results['addictionLevel'] as String;
    
    String message;
    if (addictionLevel == 'Mild Dependency') {
      message = 'Great news! Your sugar dependency is manageable. With our 60-day program, you have an excellent chance of success.';
    } else if (addictionLevel == 'Moderate Addiction') {
      message = 'Your sugar addiction is treatable. Our structured 60-day program will help you break these patterns step by step.';
    } else if (addictionLevel == 'Severe Addiction') {
      message = 'Recovery is challenging but absolutely possible. Our comprehensive support system will guide you through every step.';
    } else {
      message = 'Your journey will require dedication, but transformation is possible. You\'re not alone - we\'re here to help every step.';
    }
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.accentGreen.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.accentGreen, width: 2),
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
            '💪 Your Recovery Potential',
            style: AppTextStyles.title.copyWith(
              color: AppTheme.accentGreen,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: AppTextStyles.body.copyWith(
              color: AppTheme.textPrimary,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _getCravingLevel(int level) {
    switch (level) {
      case 0: return 'Minimal';
      case 1: return 'Low';
      case 2: return 'Moderate';
      case 3: return 'High';
      case 4: return 'Severe';
      default: return 'Unknown';
    }
  }

  String _getEnergyImpact(int level) {
    switch (level) {
      case 0: return 'Stable';
      case 1: return 'Minor fluctuations';
      case 2: return 'Noticeable crashes';
      case 3: return 'Major swings';
      case 4: return 'Severe dependency';
      default: return 'Unknown';
    }
  }

  String _getMoodImpact(int level) {
    switch (level) {
      case 0: return 'No impact';
      case 1: return 'Slight boost';
      case 2: return 'Mood swings';
      case 3: return 'Anxiety triggers';
      case 4: return 'Severe impact';
      default: return 'Unknown';
    }
  }

  String _getStressResponse(int level) {
    switch (level) {
      case 0: return 'Never';
      case 1: return 'Rarely';
      case 2: return 'Sometimes';
      case 3: return 'Often';
      case 4: return 'Primary coping';
      default: return 'Unknown';
    }
  }

  Widget _buildContinueButton(BuildContext context, WidgetRef ref, Map<String, dynamic> analysisResults) {
    return GestureDetector(
      onTap: () {
        // Save analysis results and navigate to next screen
        ref.read(onboardingFlowProvider.notifier).updateAnalysisResults(analysisResults);
        context.push('/onboarding/recovery-plan');
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppTheme.primaryBlack,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppTheme.borderDefault,
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
        child: const Center(
          child: Text(
            'View Recovery Plan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryWhite,
            ),
          ),
        ),
      ),
    );
  }
}
