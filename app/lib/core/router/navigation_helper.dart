import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/services/logger_service.dart';

class NavigationHelper {
  // Route constants
  static const String dashboard = '/dashboard';
  static const String scanner = '/scanner';
  static const String profile = '/profile';
  static const String progress = '/progress';

  // Navigate to dashboard
  static void goToDashboard(BuildContext context) {
    AppLogger.logNavigation('Navigating to dashboard');
    context.go(dashboard);
  }

  // Navigate to scanner
  static Future<String?> goToScanner(BuildContext context) async {
    AppLogger.logNavigation('Navigating to scanner');
    return await context.push<String>(scanner);
  }

  // Navigate to profile
  static void goToProfile(BuildContext context) {
    AppLogger.logNavigation('Navigating to profile');
    context.go(profile);
  }

  // Navigate to progress
  static void goToProgress(BuildContext context) {
    AppLogger.logNavigation('Navigating to progress');
    context.go(progress);
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
