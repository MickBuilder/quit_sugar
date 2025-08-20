import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:quit_suggar/features/tracking/presentation/screens/scanner_screen.dart';

class MainNavigationScreen extends HookConsumerWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: CupertinoTabScaffold(
        backgroundColor: AppTheme.darkBackground,
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
          backgroundColor: AppTheme.cardBackground,
          border: const Border(top: BorderSide(color: AppTheme.borderColor)),
          activeColor: AppTheme.accentGreen,
          inactiveColor: AppTheme.textSecondary,
          iconSize: 24,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              activeIcon: Icon(CupertinoIcons.house_fill),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar),
              activeIcon: Icon(CupertinoIcons.chart_bar_fill),
              label: 'Insights',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              activeIcon: Icon(CupertinoIcons.person_fill),
              label: 'Profile',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          AppLogger.logNavigation('Tab switched to index: $index');
          
          switch (index) {
            case 0:
              return const DashboardScreen();
            case 1:
              return _buildInsightsTab();
            case 2:
              return _buildProfileTab();
            default:
              return const DashboardScreen();
          }
        },
      ),
      floatingActionButton: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.accentGreen, Color(0xFF27AE60)],
          ),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppTheme.accentGreen.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: () {
              AppLogger.logUserAction('Pressed floating scan button');
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const ScannerScreen(),
                ),
              );
            },
            child: const Icon(
              CupertinoIcons.qrcode_viewfinder,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildInsightsTab() {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.darkBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.darkBackground,
        border: const Border(bottom: BorderSide.none),
        middle: Text(
          'Insights',
          style: EmotionalTextStyles.motivational,
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.chart_bar,
                size: 80,
                color: AppTheme.accentGreen,
              ),
              const SizedBox(height: 20),
              Text(
                'Coming Soon',
                style: EmotionalTextStyles.motivational.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                'Track your progress over time',
                style: EmotionalTextStyles.supportive,
              ),
              const SizedBox(height: 5),
              Text(
                'Weekly & monthly trends',
                style: EmotionalTextStyles.supportive,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTab() {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.darkBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.darkBackground,
        border: const Border(bottom: BorderSide.none),
        middle: Text(
          'Profile',
          style: EmotionalTextStyles.motivational,
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.person_circle,
                size: 80,
                color: AppTheme.accentGreen,
              ),
              const SizedBox(height: 20),
              Text(
                'Your Profile',
                style: EmotionalTextStyles.motivational.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                'Achievements & Settings',
                style: EmotionalTextStyles.supportive,
              ),
              const SizedBox(height: 5),
              Text(
                'Coming Soon',
                style: EmotionalTextStyles.supportive,
              ),
            ],
          ),
        ),
      ),
    );
  }
}