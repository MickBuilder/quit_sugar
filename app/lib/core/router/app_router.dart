import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/router/app_shell.dart';
import 'package:quit_suggar/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:quit_suggar/features/program/presentation/screens/progress_screen.dart';
import 'package:quit_suggar/features/support/presentation/screens/support_screen.dart';
import 'package:quit_suggar/features/tracking/presentation/screens/scanner_screen.dart';
import 'package:quit_suggar/features/tracking/presentation/screens/manual_entry_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/welcome_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/scientific_foundation_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/assessment_intro_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/personal_info_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/sugar_assessment_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/motivation_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/life_impact_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/analysis_results_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/recovery_plan_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/sugar_vow_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/addiction_indicators_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/lifestyle_motivation_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/gamification_preview_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/goal_setting_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/features/subscription/presentation/screens/revenuecat_paywall_screen.dart';

// Provider for the router
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/', // Will redirect based on onboarding status
    redirect: (context, state) async {
      // Check if user has completed onboarding
      final onboardingCompleted = await ref.read(onboardingStatusProvider.future);
      
      final isOnboardingRoute = state.fullPath?.startsWith('/welcome') == true ||
          state.fullPath?.startsWith('/onboarding') == true;
      
      // If onboarding not completed and not on onboarding route, redirect to welcome
      if (!onboardingCompleted && !isOnboardingRoute) {
        return '/welcome';
      }
      
      // If onboarding completed and on onboarding route, redirect to dashboard
      if (onboardingCompleted && isOnboardingRoute) {
        return '/dashboard';
      }
      
      return null; // No redirect needed
    },
    routes: [
      // Root redirect
      GoRoute(
        path: '/',
        redirect: (context, state) => '/dashboard',
      ),
      
      // Enhanced Onboarding flow
      GoRoute(
        path: '/welcome',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: WelcomeScreen()),
      ),
      GoRoute(
        path: '/onboarding/scientific-foundation',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ScientificFoundationScreen()),
      ),
      GoRoute(
        path: '/onboarding/assessment-intro',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: AssessmentIntroScreen()),
      ),
      GoRoute(
        path: '/onboarding/personal-info',
        pageBuilder: (context, state) =>
            const MaterialPage(child: PersonalInfoScreen()),
      ),
      GoRoute(
        path: '/onboarding/sugar-assessment',
        pageBuilder: (context, state) =>
            const MaterialPage(child: SugarAssessmentScreen()),
      ),
      GoRoute(
        path: '/onboarding/addiction-indicators',
        pageBuilder: (context, state) =>
            const MaterialPage(child: AddictionIndicatorsScreen()),
      ),
      GoRoute(
        path: '/onboarding/lifestyle-motivation',
        pageBuilder: (context, state) =>
            const MaterialPage(child: LifestyleMotivationScreen()),
      ),
      GoRoute(
        path: '/onboarding/motivation',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: MotivationScreen()),
      ),
      GoRoute(
        path: '/onboarding/life-impact',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: LifeImpactScreen()),
      ),
      GoRoute(
        path: '/onboarding/analysis-results',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: AnalysisResultsScreen()),
      ),
      GoRoute(
        path: '/onboarding/recovery-plan',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: RecoveryPlanScreen()),
      ),
      GoRoute(
        path: '/onboarding/sugar-vow',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SugarVowScreen()),
      ),
      GoRoute(
        path: '/onboarding/gamification-preview',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: GamificationPreviewScreen()),
      ),
      // Legacy onboarding routes (for backward compatibility)
      GoRoute(
        path: '/onboarding/health-questionnaire',
        pageBuilder: (context, state) {
          final dailySugarStr = state.uri.queryParameters['dailySugar'] ?? '25.0';
          final dailySugar = double.tryParse(dailySugarStr) ?? 25.0;
          return NoTransitionPage(
            child: GoalSettingScreen(currentDailySugar: dailySugar),
          );
        },
      ),
      GoRoute(
        path: '/onboarding/completion',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: RevenueCatPaywallScreen(source: 'onboarding')),
      ),
      
      // Main app flow
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: DashboardScreen()),
          ),
          GoRoute(
            path: '/support',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SupportScreen()),
          ),
          GoRoute(
            path: '/program',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProgressScreen()),
          ),
        ],
      ),
      GoRoute(
        path: '/scanner',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ScannerScreen()),
      ),
      GoRoute(
        path: '/manual-entry',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ManualEntryScreen()),
      ),
    ],
  );
});


final appRouter = routerProvider;
