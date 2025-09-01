import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

/// Base class for all app screens that need Riverpod state management
/// Enforces consistent state access patterns and error handling
abstract class AppScreen extends HookConsumerWidget {
  const AppScreen({super.key});

  /// Build the screen content with consistent state management
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Pre-build setup
    _onScreenBuild(context, ref);
    
    return _buildScreen(context, ref);
  }

  /// Called before building the screen - use for initialization
  void _onScreenBuild(BuildContext context, WidgetRef ref) {
    // Override in subclasses if needed
  }

  /// Build the actual screen content
  Widget _buildScreen(BuildContext context, WidgetRef ref);

  /// Standard error handling for all screens
  Widget buildErrorState(BuildContext context, Object error, StackTrace? stackTrace) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        middle: const Text('Error'),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.exclamationmark_triangle_fill,
                  color: AppTheme.accentRed,
                  size: 64,
                ),
                const SizedBox(height: 24),
                Text(
                  'Something went wrong',
                  style: AppTextStyles.heading,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Please try again or contact support if the problem persists.',
                  style: AppTextStyles.body.copyWith(
                    color: AppTheme.textMuted,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                CupertinoButton(
                  color: AppTheme.primaryBlack,
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Go Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Standard loading state for all screens
  Widget buildLoadingState(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.background,
        border: const Border(bottom: BorderSide.none),
        middle: const Text('Loading'),
      ),
      child: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(radius: 20),
              SizedBox(height: 16),
              Text(
                'Loading...',
                style: TextStyle(color: AppTheme.textPrimary, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Base class for all app widgets that need Riverpod state management
/// Enforces consistent state access patterns
abstract class AppWidget extends HookConsumerWidget {
  const AppWidget({super.key});

  /// Build the widget content with consistent state management
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildWidget(context, ref);
  }

  /// Build the actual widget content
  Widget _buildWidget(BuildContext context, WidgetRef ref);

  /// Standard error handling for widgets
  Widget buildErrorState(BuildContext context, Object error) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.accentRed.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.accentRed, width: 1),
      ),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_triangle_fill,
            color: AppTheme.accentRed,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child:             Text(
              'Error loading content',
              style: AppTextStyles.body.copyWith(
                color: AppTheme.accentRed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Standard loading state for widgets
  Widget buildLoadingState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Row(
        children: [
          CupertinoActivityIndicator(radius: 12),
          SizedBox(width: 12),
          Text(
            'Loading...',
            style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

/// Base class for dialogs and modals
abstract class AppDialog extends HookConsumerWidget {
  const AppDialog({super.key});

  /// Build the dialog content with consistent state management
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildDialog(context, ref);
  }

  /// Build the actual dialog content
  Widget _buildDialog(BuildContext context, WidgetRef ref);

  /// Standard error handling for dialogs
  Widget buildErrorState(BuildContext context, Object error) {
    return CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('Failed to load content: $error'),
      actions: [
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

/// Base class for bottom sheets
abstract class AppBottomSheet extends HookConsumerWidget {
  const AppBottomSheet({super.key});

  /// Build the bottom sheet content with consistent state management
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildBottomSheet(context, ref);
  }

  /// Build the actual bottom sheet content
  Widget _buildBottomSheet(BuildContext context, WidgetRef ref);

  /// Standard error handling for bottom sheets
  Widget buildErrorState(BuildContext context, Object error) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_triangle_fill,
            color: AppTheme.accentRed,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading content',
            style: AppTextStyles.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Please try again',
            style: AppTextStyles.body.copyWith(
              color: AppTheme.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
