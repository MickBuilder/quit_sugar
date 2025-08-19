import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/router/app_router.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

class NavigationHelper {
  // Navigate to dashboard
  static void goToDashboard(BuildContext context) {
    AppLogger.logNavigation('Navigating to dashboard');
    context.go(AppRouter.dashboard);
  }

  // Navigate to scanner
  static Future<String?> goToScanner(BuildContext context) async {
    AppLogger.logNavigation('Navigating to scanner');
    return await context.push<String>(AppRouter.scanner);
  }

  // Navigate to profile
  static void goToProfile(BuildContext context) {
    AppLogger.logNavigation('Navigating to profile');
    context.go(AppRouter.profile);
  }

  // Navigate to settings
  static void goToSettings(BuildContext context) {
    AppLogger.logNavigation('Navigating to settings');
    context.go(AppRouter.settings);
  }

  // Navigate to achievements
  static void goToAchievements(BuildContext context) {
    AppLogger.logNavigation('Navigating to achievements');
    context.go(AppRouter.achievements);
  }

  // Navigate to insights
  static void goToInsights(BuildContext context) {
    AppLogger.logNavigation('Navigating to insights');
    context.go(AppRouter.insights);
  }

  // Go back
  static void goBack(BuildContext context) {
    AppLogger.logNavigation('Going back');
    context.pop();
  }

  // Check if we can go back
  static bool canGoBack(BuildContext context) {
    final canGoBack = context.canPop();
    AppLogger.logNavigation('Can go back: $canGoBack');
    return canGoBack;
  }
}
