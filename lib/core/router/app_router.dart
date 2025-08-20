import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/router/main_navigation.dart';
import 'package:quit_suggar/features/tracking/presentation/screens/scanner_screen.dart';

class AppRouter {
  static const String dashboard = '/';
  static const String scanner = '/scanner';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String achievements = '/achievements';
  static const String insights = '/insights';

  static GoRouter get router => GoRouter(
        initialLocation: dashboard,
        routes: [
          GoRoute(
            path: dashboard,
            name: 'dashboard',
            builder: (context, state) => const MainNavigationScreen(),
          ),
          GoRoute(
            path: scanner,
            name: 'scanner',
            builder: (context, state) => const ScannerScreen(),
          ),
          // Add more routes as you create the screens
          GoRoute(
            path: profile,
            name: 'profile',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Profile Screen - Coming Soon'),
              ),
            ),
          ),
          GoRoute(
            path: settings,
            name: 'settings',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Settings Screen - Coming Soon'),
              ),
            ),
          ),
          GoRoute(
            path: achievements,
            name: 'achievements',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Achievements Screen - Coming Soon'),
              ),
            ),
          ),
          GoRoute(
            path: insights,
            name: 'insights',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Insights Screen - Coming Soon'),
              ),
            ),
          ),
        ],
      );
}
