import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class AppShell extends ConsumerWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = GoRouterState.of(context).uri.path;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: child,
      bottomNavigationBar: _buildBottomNavigation(context, currentLocation),
    );
  }

  Widget _buildBottomNavigation(BuildContext context, String currentLocation) {
    final currentIndex = _getTabIndex(currentLocation);
    
    return CupertinoTabBar(
      backgroundColor: AppTheme.background,
      border: const Border(top: BorderSide.none),
      activeColor: AppTheme.primaryBlack,
      inactiveColor: AppTheme.textMuted,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          activeIcon: Icon(CupertinoIcons.house_fill),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chart_bar),
          activeIcon: Icon(CupertinoIcons.chart_bar_fill),
          label: 'Progress',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          activeIcon: Icon(CupertinoIcons.person_fill),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) => _onTabTapped(context, index, currentIndex),
    );
  }

  int _getTabIndex(String location) {
    switch (location) {
      case '/dashboard':
        return 0;
      case '/progress':
        return 1;
      case '/profile':
        return 2;
      default:
        return 0;
    }
  }

  void _onTabTapped(BuildContext context, int index, int currentIndex) {
    // Prevent unnecessary navigation if already on the same tab
    if (index == currentIndex) {
      AppLogger.logNavigation('Already on tab index: $index');
      return;
    }

    AppLogger.logNavigation('Tab switched from index: $currentIndex to index: $index');

    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/progress');
        break;
      case 2:
        context.go('/profile');
        break;
    }
  }
}
