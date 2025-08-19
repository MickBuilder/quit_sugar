import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppTheme {
  // Color palette inspired by Rise app but adapted for sugar addiction recovery
  static const Color primaryOrange = Color(0xFFFF6B35); // Vibrant orange for motivation
  static const Color secondaryBlue = Color(0xFF4ECDC4); // Calming blue for progress
  static const Color accentGreen = Color(0xFF2ECC71); // Success green for achievements
  static const Color warningRed = Color(0xFFE74C3C); // Warning red for sugar alerts
  static const Color darkBackground = Color(0xFF1A1A1A); // Deep dark background
  static const Color cardBackground = Color(0xFF2D2D2D); // Slightly lighter for cards
  static const Color textPrimary = Color(0xFFFFFFFF); // Pure white text
  static const Color textSecondary = Color(0xFFB0B0B0); // Muted text
  static const Color borderColor = Color(0xFF404040); // Subtle borders

  // Emotional/addiction-focused colors
  static const Color cravingColor = Color(0xFFFF8A65); // Warm orange for cravings
  static const Color withdrawalColor = Color(0xFF9FA8DA); // Cool blue for withdrawal
  static const Color victoryColor = Color(0xFF66BB6A); // Green for victories
  static const Color relapseColor = Color(0xFFEF5350); // Red for relapses

  static ShadThemeData get darkTheme => ShadThemeData(
    brightness: Brightness.dark,
        colorScheme: const ShadColorScheme(
          background: darkBackground,
          foreground: textPrimary,
          primary: primaryOrange,
          primaryForeground: textPrimary,
          secondary: secondaryBlue,
          secondaryForeground: textPrimary,
          muted: cardBackground,
          mutedForeground: textSecondary,
          accent: accentGreen,
          accentForeground: textPrimary,
          destructive: warningRed,
          destructiveForeground: textPrimary,
          border: borderColor,
          input: cardBackground,
          ring: primaryOrange,
          selection: primaryOrange,
          card: cardBackground,
          cardForeground: textPrimary,
          popover: cardBackground,
          popoverForeground: textPrimary,
        ),
      );

  // Custom color schemes for different emotional states
  static ShadColorScheme get cravingTheme => const ShadColorScheme(
        background: darkBackground,
        foreground: textPrimary,
        primary: cravingColor,
        primaryForeground: textPrimary,
        secondary: secondaryBlue,
        secondaryForeground: textPrimary,
        muted: cardBackground,
        mutedForeground: textSecondary,
        accent: accentGreen,
        accentForeground: textPrimary,
        destructive: warningRed,
        destructiveForeground: textPrimary,
        border: borderColor,
        input: cardBackground,
        ring: cravingColor,
        selection: cravingColor,
        card: cardBackground,
        cardForeground: textPrimary,
        popover: cardBackground,
        popoverForeground: textPrimary,
      );

  static ShadColorScheme get withdrawalTheme => const ShadColorScheme(
        background: darkBackground,
        foreground: textPrimary,
        primary: withdrawalColor,
        primaryForeground: textPrimary,
        secondary: secondaryBlue,
        secondaryForeground: textPrimary,
        muted: cardBackground,
        mutedForeground: textSecondary,
        accent: accentGreen,
        accentForeground: textPrimary,
        destructive: warningRed,
        destructiveForeground: textPrimary,
        border: borderColor,
        input: cardBackground,
        ring: withdrawalColor,
        selection: withdrawalColor,
        card: cardBackground,
        cardForeground: textPrimary,
        popover: cardBackground,
        popoverForeground: textPrimary,
      );

  static ShadColorScheme get victoryTheme => const ShadColorScheme(
        background: darkBackground,
        foreground: textPrimary,
        primary: victoryColor,
        primaryForeground: textPrimary,
        secondary: secondaryBlue,
        secondaryForeground: textPrimary,
        muted: cardBackground,
        mutedForeground: textSecondary,
        accent: accentGreen,
        accentForeground: textPrimary,
        destructive: warningRed,
        destructiveForeground: textPrimary,
        border: borderColor,
        input: cardBackground,
        ring: victoryColor,
        selection: victoryColor,
        card: cardBackground,
        cardForeground: textPrimary,
        popover: cardBackground,
        popoverForeground: textPrimary,
      );

  static ShadColorScheme get relapseTheme => const ShadColorScheme(
        background: darkBackground,
        foreground: textPrimary,
        primary: relapseColor,
        primaryForeground: textPrimary,
        secondary: secondaryBlue,
        secondaryForeground: textPrimary,
        muted: cardBackground,
        mutedForeground: textSecondary,
        accent: accentGreen,
        accentForeground: textPrimary,
        destructive: warningRed,
        destructiveForeground: textPrimary,
        border: borderColor,
        input: cardBackground,
        ring: relapseColor,
        selection: relapseColor,
        card: cardBackground,
        cardForeground: textPrimary,
        popover: cardBackground,
        popoverForeground: textPrimary,
      );
}

// Custom text styles for emotional content
class EmotionalTextStyles {
  static const TextStyle motivational = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppTheme.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle supportive = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppTheme.textSecondary,
    height: 1.4,
  );

  static const TextStyle achievement = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppTheme.victoryColor,
    letterSpacing: -0.3,
  );

  static const TextStyle warning = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppTheme.warningRed,
  );

  static const TextStyle progress = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppTheme.primaryOrange,
    letterSpacing: -0.5,
  );
}

// Custom card styles
class CardStyles {
  static BoxDecoration get primary => BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      );

  static BoxDecoration get achievement => BoxDecoration(
        color: AppTheme.victoryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.victoryColor.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppTheme.victoryColor.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      );

  static BoxDecoration get warning => BoxDecoration(
        color: AppTheme.warningRed.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.warningRed.withOpacity(0.3), width: 1),
      );

  static BoxDecoration get progress => BoxDecoration(
        color: AppTheme.primaryOrange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryOrange.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryOrange.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      );
}

// Gradient backgrounds for emotional states
class EmotionalGradients {
  static const LinearGradient motivation = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppTheme.primaryOrange,
      Color(0xFFFF8A65),
    ],
  );

  static const LinearGradient calm = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppTheme.secondaryBlue,
      Color(0xFF81C784),
    ],
  );

  static const LinearGradient victory = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppTheme.victoryColor,
      Color(0xFF4CAF50),
    ],
  );

  static const LinearGradient support = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppTheme.darkBackground,
      Color(0xFF2D2D2D),
    ],
  );
}
