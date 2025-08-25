import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/router/app_shell.dart';
import 'package:quit_suggar/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:quit_suggar/features/progress/presentation/screens/progress_screen.dart';
import 'package:quit_suggar/features/tracking/presentation/screens/scanner_screen.dart';
import 'package:quit_suggar/features/tracking/presentation/screens/manual_entry_screen.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

// Provider for the router
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/dashboard',
    routes: [
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
