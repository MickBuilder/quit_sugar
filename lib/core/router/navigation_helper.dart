import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/router/app_router.dart';

class NavigationHelper {
  // Navigate to dashboard
  static void goToDashboard(BuildContext context) {
    context.go(AppRouter.dashboard);
  }

  // Navigate to scanner
  static Future<String?> goToScanner(BuildContext context) async {
    return await context.push<String>(AppRouter.scanner);
  }

  // Navigate to profile
  static void goToProfile(BuildContext context) {
    context.go(AppRouter.profile);
  }

  // Navigate to settings
  static void goToSettings(BuildContext context) {
    context.go(AppRouter.settings);
  }

  // Navigate to achievements
  static void goToAchievements(BuildContext context) {
    context.go(AppRouter.achievements);
  }

  // Navigate to insights
  static void goToInsights(BuildContext context) {
    context.go(AppRouter.insights);
  }

  // Go back
  static void goBack(BuildContext context) {
    context.pop();
  }

  // Check if we can go back
  static bool canGoBack(BuildContext context) {
    return context.canPop();
  }
}
