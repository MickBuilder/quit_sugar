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
      floatingActionButton: currentLocation == '/dashboard'
          ? _buildFloatingActionButton(context)
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildBottomNavigation(BuildContext context, String currentLocation) {
    return CupertinoTabBar(
      backgroundColor: AppTheme.background,
      border: const Border(top: BorderSide.none), // Remove the top border line
      activeColor: AppTheme.primaryBlack,
      inactiveColor: AppTheme.textMuted,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chart_bar),
          label: 'Progress',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _getTabIndex(currentLocation),
      onTap: (index) => _onTabTapped(context, index),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: AppTheme.primaryBlack,
        borderRadius: BorderRadius.circular(8), // Rounded corners
        border: Border.all(color: AppTheme.borderDefault, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlack.withValues(alpha: 0.7),
            blurRadius: 0,
            offset: const Offset(4, 4), // Smaller shadow
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            AppLogger.logUserAction('Pressed floating scan button');
            context.push('/scanner');
          },
          child: const Icon(
            CupertinoIcons.qrcode_viewfinder,
            color: AppTheme.primaryWhite,
            size: 28,
          ),
        ),
      ),
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

  void _onTabTapped(BuildContext context, int index) {
    AppLogger.logNavigation('Tab switched to index: $index');

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
