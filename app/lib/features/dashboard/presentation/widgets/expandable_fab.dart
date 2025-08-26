import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class ExpandableFab extends HookConsumerWidget {
  const ExpandableFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    final rotationAnimation = Tween<double>(
      begin: 0,
      end: 0.125, // 45 degree rotation (1/8 of a full turn)
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    useEffect(() {
      if (isExpanded.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      return null;
    }, [isExpanded.value]);

    return Stack(
      children: [
        // Background overlay when expanded - covers entire SafeArea
        if (isExpanded.value)
          Positioned.fill(
            child: GestureDetector(
              onTap: () => isExpanded.value = false,
              child: Container(
                color: Colors.black.withValues(alpha: 0.5),
              ),
            ),
          ),
        
        // Action buttons - positioned from bottom up above the main FAB
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          bottom: isExpanded.value ? 90 : 16, // Above main FAB
          right: 16,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isExpanded.value ? 1.0 : 0.0,
            child: _buildActionItem(
              context,
              icon: CupertinoIcons.qrcode,
              label: 'Scan',
              onTap: () {
                isExpanded.value = false;
                context.push('/scanner');
              },
            ),
          ),
        ),
        
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          bottom: isExpanded.value ? 160 : 16, // Above scan button
          right: 16,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isExpanded.value ? 1.0 : 0.0,
            child: _buildActionItem(
              context,
              icon: CupertinoIcons.pencil,
              label: 'Manual Entry',
              onTap: () {
                isExpanded.value = false;
                context.push('/manual-entry');
              },
            ),
          ),
        ),
        
        // Main FAB - positioned at very bottom right
        Positioned(
          bottom: 16, // At the very bottom
          right: 16,
          child: GestureDetector(
            onTap: () => isExpanded.value = !isExpanded.value,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppTheme.primaryBlack,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppTheme.borderDefault,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                    blurRadius: 0,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: AnimatedBuilder(
                animation: rotationAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: rotationAnimation.value * 2 * 3.14159, // Convert to radians
                    child: Icon(
                      isExpanded.value ? CupertinoIcons.xmark : CupertinoIcons.add,
                      color: AppTheme.primaryWhite,
                      size: 28,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text label
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppTheme.surfaceBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppTheme.borderDefault,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                  blurRadius: 0,
                  offset: const Offset(3, 3),
                ),
              ],
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Circular icon button
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppTheme.primaryBlack,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppTheme.borderDefault,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                  blurRadius: 0,
                  offset: const Offset(3, 3),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryWhite,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}