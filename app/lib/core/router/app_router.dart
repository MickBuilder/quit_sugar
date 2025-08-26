import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/router/app_shell.dart';
import 'package:quit_suggar/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:quit_suggar/features/progress/presentation/screens/progress_screen.dart';
import 'package:quit_suggar/features/tracking/presentation/screens/scanner_screen.dart';
import 'package:quit_suggar/features/tracking/presentation/screens/manual_entry_screen.dart';
import 'package:quit_suggar/features/tracking/presentation/screens/daily_logs_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/welcome_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/personal_info_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/sugar_assessment_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/goal_setting_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/screens/completion_screen.dart';
import 'package:quit_suggar/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

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
      
      // Onboarding flow
      GoRoute(
        path: '/welcome',
        pageBuilder: (context, state) =>
            const MaterialPage(child: WelcomeScreen()),
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
        path: '/onboarding/health-questionnaire',
        pageBuilder: (context, state) {
          final dailySugarStr = state.uri.queryParameters['dailySugar'] ?? '25.0';
          final dailySugar = double.tryParse(dailySugarStr) ?? 25.0;
          return MaterialPage(
            child: GoalSettingScreen(currentDailySugar: dailySugar),
          );
        },
      ),
      GoRoute(
        path: '/onboarding/completion',
        pageBuilder: (context, state) =>
            const MaterialPage(child: CompletionScreen()),
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
            path: '/progress',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProgressScreen()),
          ),
          GoRoute(
            path: '/daily-logs',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: DailyLogsScreen()),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: _buildProfileScreen()),
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

Widget _buildProfileScreen() {
  return CupertinoPageScaffold(
    backgroundColor: AppTheme.background,
    navigationBar: CupertinoNavigationBar(
      backgroundColor: AppTheme.background,
      border: const Border(bottom: BorderSide.none),
      middle: Text('Profile', style: TextStyle(color: AppTheme.textPrimary)),
    ),
    child: SafeArea(
      child: Container(
        color: AppTheme.background,
        child: const Center(
          child: Text(
            'Profile Screen - Coming Soon',
            style: TextStyle(color: AppTheme.textPrimary),
          ),
        ),
      ),
    ),
  );
}

final appRouter = routerProvider;
