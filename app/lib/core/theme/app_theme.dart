import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppTheme {
  // Neubrutalism color palette - high contrast black and white
  static const Color primaryBlack = Color(
    0xFF000000,
  ); // Pure black for text and borders
  static const Color primaryWhite = Color(
    0xFFFFFFFF,
  ); // Pure white for backgrounds
  static const Color accentOrange = Color(
    0xFFFF6B35,
  ); // Orange for sunrise/sun elements
  static const Color accentBlue = Color(0xFF4ECDC4); // Blue for water elements
  static const Color accentYellow = Color(
    0xFFFFD93D,
  ); // Yellow for stars and highlights
  static const Color accentGrey = Color(
    0xFF6C757D,
  ); // Grey for inactive elements

  // Background system - pure white background
  static const Color background = Color(0xFFFFFFFF); // Pure white background
  static const Color surfaceBackground = Color(
    0xFFFFFFFF,
  ); // White surface backgrounds
  static const Color elevatedSurface = Color(
    0xFFFFFFFF,
  ); // White elevated surfaces

  // Text hierarchy - black text on white
  static const Color textPrimary = Color(
    0xFF000000,
  ); // Pure black for primary text
  static const Color textSecondary = Color(
    0xFF000000,
  ); // Black for secondary text
  static const Color textTertiary = Color(
    0xFF000000,
  ); // Black for tertiary text
  static const Color textMuted = Color(0xFF6C757D); // Grey for muted text

  // Border and separator colors - black borders
  static const Color borderSubtle = Color(0xFF000000); // Black borders
  static const Color borderDefault = Color(0xFF000000); // Black borders
  static const Color borderStrong = Color(0xFF000000); // Black borders

  // Gamified colors
  static const Color starFilled = Color(0xFFFFD93D); // Yellow for filled stars
  static const Color starEmpty = Color(0xFF6C757D); // Grey for empty stars
  static const Color progressBar = Color(0xFF000000); // Black progress bars

  // Legacy color constants for compatibility (mapped to new theme)
  static const Color primaryBlue = primaryBlack; // Legacy mapping
  static const Color secondaryTeal = primaryBlack; // Legacy mapping
  static const Color accentGreen = primaryBlack; // Legacy mapping
  static const Color warningAmber = accentOrange; // Legacy mapping
  static const Color criticalRed = primaryBlack; // Legacy mapping
  static const Color supportColor = primaryBlack; // Legacy mapping
  static const Color progressColor = primaryBlack; // Legacy mapping
  static const Color cautionColor = accentOrange; // Legacy mapping
  static const Color dangerColor = primaryBlack; // Legacy mapping
  static const Color darkBackground = background; // Legacy mapping

  static ShadThemeData get darkTheme => ShadThemeData(
    brightness: Brightness.light, // Changed to light for white background
    colorScheme: const ShadColorScheme(
      background: background,
      foreground: textPrimary,
      primary: primaryBlack,
      primaryForeground: primaryWhite,
      secondary: primaryBlack,
      secondaryForeground: primaryWhite,
      muted: surfaceBackground,
      mutedForeground: textSecondary,
      accent: accentOrange,
      accentForeground: primaryWhite,
      destructive: primaryBlack,
      destructiveForeground: primaryWhite,
      border: borderDefault,
      input: surfaceBackground,
      ring: primaryBlack,
      selection: primaryBlack,
      card: surfaceBackground,
      cardForeground: textPrimary,
      popover: elevatedSurface,
      popoverForeground: textPrimary,
    ),
  );

  // Custom color schemes for different states
  static ShadColorScheme get supportTheme => const ShadColorScheme(
    background: background,
    foreground: textPrimary,
    primary: primaryBlack,
    primaryForeground: primaryWhite,
    secondary: primaryBlack,
    secondaryForeground: primaryWhite,
    muted: surfaceBackground,
    mutedForeground: textSecondary,
    accent: accentOrange,
    accentForeground: primaryWhite,
    destructive: primaryBlack,
    destructiveForeground: primaryWhite,
    border: borderDefault,
    input: surfaceBackground,
    ring: primaryBlack,
    selection: primaryBlack,
    card: surfaceBackground,
    cardForeground: textPrimary,
    popover: elevatedSurface,
    popoverForeground: textPrimary,
  );

  static ShadColorScheme get cautionTheme => const ShadColorScheme(
    background: background,
    foreground: textPrimary,
    primary: primaryBlack,
    primaryForeground: primaryWhite,
    secondary: primaryBlack,
    secondaryForeground: primaryWhite,
    muted: surfaceBackground,
    mutedForeground: textSecondary,
    accent: accentOrange,
    accentForeground: primaryWhite,
    destructive: primaryBlack,
    destructiveForeground: primaryWhite,
    border: borderDefault,
    input: surfaceBackground,
    ring: primaryBlack,
    selection: primaryBlack,
    card: surfaceBackground,
    cardForeground: textPrimary,
    popover: elevatedSurface,
    popoverForeground: textPrimary,
  );

  static ShadColorScheme get progressTheme => const ShadColorScheme(
    background: background,
    foreground: textPrimary,
    primary: primaryBlack,
    primaryForeground: primaryWhite,
    secondary: primaryBlack,
    secondaryForeground: primaryWhite,
    muted: surfaceBackground,
    mutedForeground: textSecondary,
    accent: accentOrange,
    accentForeground: primaryWhite,
    destructive: primaryBlack,
    destructiveForeground: primaryWhite,
    border: borderDefault,
    input: surfaceBackground,
    ring: primaryBlack,
    selection: primaryBlack,
    card: surfaceBackground,
    cardForeground: textPrimary,
    popover: elevatedSurface,
    popoverForeground: textPrimary,
  );

  static ShadColorScheme get challengeTheme => const ShadColorScheme(
    background: background,
    foreground: textPrimary,
    primary: primaryBlack,
    primaryForeground: primaryWhite,
    secondary: primaryBlack,
    secondaryForeground: primaryWhite,
    muted: surfaceBackground,
    mutedForeground: textSecondary,
    accent: accentOrange,
    accentForeground: primaryWhite,
    destructive: primaryBlack,
    destructiveForeground: primaryWhite,
    border: borderDefault,
    input: surfaceBackground,
    ring: primaryBlack,
    selection: primaryBlack,
    card: surfaceBackground,
    cardForeground: textPrimary,
    popover: elevatedSurface,
    popoverForeground: textPrimary,
  );
}

// Neubrutalism text styles - bold, functional typography
class EmotionalTextStyles {
  static const TextStyle motivational = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: AppTheme.textPrimary,
    letterSpacing: -0.5,
    height: 1.1,
  );

  static const TextStyle supportive = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppTheme.textPrimary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  static const TextStyle achievement = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppTheme.textPrimary,
    letterSpacing: -0.2,
    height: 1.2,
  );

  static const TextStyle caution = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppTheme.textPrimary,
    letterSpacing: 0.1,
  );

  static const TextStyle progress = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: AppTheme.textPrimary,
    letterSpacing: -0.5,
    height: 1.0,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppTheme.textPrimary,
    height: 1.3,
    letterSpacing: 0.2,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppTheme.textMuted,
    height: 1.2,
    letterSpacing: 0.3,
  );
}

// Neubrutalism card styles - sharp corners, specific shadows
class CardStyles {
  static BoxDecoration get primary => BoxDecoration(
    color: AppTheme.surfaceBackground,
    borderRadius: BorderRadius.circular(8), // Rounded corners
    border: Border.all(color: AppTheme.borderDefault, width: 2),
    boxShadow: [
      BoxShadow(
        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
        blurRadius: 0,
        offset: const Offset(4, 4), // Smaller shadow
      ),
    ],
  );

  static BoxDecoration get elevated => BoxDecoration(
    color: AppTheme.elevatedSurface,
    borderRadius: BorderRadius.circular(8), // Rounded corners
    border: Border.all(color: AppTheme.borderDefault, width: 2),
    boxShadow: [
      BoxShadow(
        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
        blurRadius: 0,
        offset: const Offset(4, 4), // Smaller shadow
      ),
    ],
  );

  static BoxDecoration get achievement => BoxDecoration(
    color: AppTheme.surfaceBackground,
    borderRadius: BorderRadius.circular(8), // Rounded corners
    border: Border.all(color: AppTheme.borderDefault, width: 2),
    boxShadow: [
      BoxShadow(
        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
        blurRadius: 0,
        offset: const Offset(4, 4), // Smaller shadow
      ),
    ],
  );

  static BoxDecoration get caution => BoxDecoration(
    color: AppTheme.surfaceBackground,
    borderRadius: BorderRadius.circular(8), // Rounded corners
    border: Border.all(color: AppTheme.borderDefault, width: 2),
    boxShadow: [
      BoxShadow(
        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
        blurRadius: 0,
        offset: const Offset(4, 4), // Smaller shadow
      ),
    ],
  );

  static BoxDecoration get progress => BoxDecoration(
    color: AppTheme.surfaceBackground,
    borderRadius: BorderRadius.circular(8), // Rounded corners
    border: Border.all(color: AppTheme.borderDefault, width: 2),
    boxShadow: [
      BoxShadow(
        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
        blurRadius: 0,
        offset: const Offset(4, 4), // Smaller shadow
      ),
    ],
  );

  static BoxDecoration get support => BoxDecoration(
    color: AppTheme.surfaceBackground,
    borderRadius: BorderRadius.circular(8), // Rounded corners
    border: Border.all(color: AppTheme.borderDefault, width: 2),
    boxShadow: [
      BoxShadow(
        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
        blurRadius: 0,
        offset: const Offset(4, 4), // Smaller shadow
      ),
    ],
  );

  // Task card style with illustrative background
  static BoxDecoration get taskCard => BoxDecoration(
    color: AppTheme.surfaceBackground,
    borderRadius: BorderRadius.circular(8), // Rounded corners
    border: Border.all(color: AppTheme.borderDefault, width: 2),
    boxShadow: [
      BoxShadow(
        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
        blurRadius: 0,
        offset: const Offset(4, 4), // Smaller shadow
      ),
    ],
  );

  // Tab button styles
  static BoxDecoration get activeTab => BoxDecoration(
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
  );

  static BoxDecoration get inactiveTab => BoxDecoration(
    color: AppTheme.surfaceBackground,
    borderRadius: BorderRadius.circular(8), // Rounded corners
    border: Border.all(color: AppTheme.borderDefault, width: 2),
    boxShadow: [
      BoxShadow(
        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
        blurRadius: 0,
        offset: const Offset(4, 4), // Smaller shadow
      ),
    ],
  );

  // Progress bar style
  static BoxDecoration get progressBar => BoxDecoration(
    color: AppTheme.surfaceBackground,
    borderRadius: BorderRadius.circular(8), // Rounded corners
    border: Border.all(color: AppTheme.borderDefault, width: 1),
    boxShadow: [
      BoxShadow(
        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
        blurRadius: 0,
        offset: const Offset(3, 3), // Smaller shadow for progress bar
      ),
    ],
  );

  // Button style with shadow
  static BoxDecoration get button => BoxDecoration(
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
  );

  // Navigation button style
  static BoxDecoration get navButton => BoxDecoration(
    color: AppTheme.surfaceBackground,
    borderRadius: BorderRadius.circular(8), // Rounded corners
    border: Border.all(color: AppTheme.borderDefault, width: 2),
    boxShadow: [
      BoxShadow(
        color: AppTheme.primaryBlack.withValues(alpha: 0.7),
        blurRadius: 0,
        offset: const Offset(3, 3), // Smaller shadow for nav buttons
      ),
    ],
  );
}

// Neubrutalism gradients - flat, high contrast
class EmotionalGradients {
  static const LinearGradient motivation = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppTheme.primaryWhite, AppTheme.primaryWhite],
    stops: [0.0, 1.0],
  );

  static const LinearGradient calm = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppTheme.primaryWhite, AppTheme.primaryWhite],
    stops: [0.0, 1.0],
  );

  static const LinearGradient progress = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppTheme.primaryWhite, AppTheme.primaryWhite],
    stops: [0.0, 1.0],
  );

  static const LinearGradient support = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppTheme.primaryWhite, AppTheme.primaryWhite],
    stops: [0.0, 1.0],
  );

  static const LinearGradient subtle = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppTheme.primaryWhite, AppTheme.primaryWhite],
    stops: [0.0, 1.0],
  );
}
