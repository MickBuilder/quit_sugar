# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Core Flutter Commands
- `flutter run` - Run the app on connected device/emulator
- `flutter run -d ios` - Run specifically on iOS
- `flutter run -d android` - Run specifically on Android
- `flutter pub get` - Install dependencies
- `flutter clean` - Clean build files
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app

### Code Generation
- `dart run build_runner build` - Generate code (Riverpod providers)
- `dart run build_runner build --delete-conflicting-outputs` - Force regenerate
- `dart run build_runner watch` - Watch mode for continuous generation

### Testing & Quality
- `flutter test` - Run unit tests
- `flutter analyze` - Static analysis
- `dart run custom_lint` - Custom linting rules
- `dart run riverpod_lint` - Riverpod-specific linting

### Environment Variables
The app requires Supabase configuration. Run with:
```bash
flutter run --dart-define=SUPABASE_URL=your_url --dart-define=SUPABASE_ANON_KEY=your_key
```

## Architecture

This is a Flutter app for sugar addiction recovery using **Clean Architecture** with:

### Core Structure
- **Presentation**: Screens, widgets, Riverpod providers
- **Domain**: Business logic, entities, use cases  
- **Data**: Services, external APIs, data models

### Key Dependencies
- **State Management**: Riverpod with code generation (`@riverpod` annotations)
- **Navigation**: go_router with declarative routes
- **UI**: shadcn_ui components with Material 3 theming
- **Networking**: http for API calls
- **Scanning**: mobile_scanner for barcode scanning
- **Logging**: Custom logger service with structured logging

### Feature-Based Organization
```
lib/
├── core/           # Shared utilities, services, themes
├── features/       # Feature modules (dashboard, tracking, etc.)
│   └── feature_name/
│       └── presentation/
│           ├── screens/    # Keep screen files concise
│           └── widgets/    # Extract complex widgets here
├── shared/         # Shared widgets and providers
└── main.dart
```

### Code Organization Rules
- **Screen files should be as concise as possible**
- **Extract complex widgets to `/presentation/widgets/` folder within each feature**
- **Maximum recommended screen file size: ~250-300 lines**
- **Any reusable or complex UI components should be separate widget files**
- **Screen files should focus on layout and state management, not complex UI logic**

### Navigation Structure
Routes defined in `lib/core/router/app_router.dart`:
- `/` (dashboard) - Main screen
- `/scanner` - Barcode scanning
- `/profile`, `/settings`, `/achievements`, `/insights` - Feature screens

### State Management Patterns
- Use `@riverpod` annotations for providers
- Services are injected via providers
- UI components consume providers with `ref.watch()`
- Always run `dart run build_runner build` after adding/modifying providers

### Theme System
- Dark theme focused on addiction recovery
- Emotional state-based color schemes (craving, withdrawal, victory, relapse)
- Custom card styles and gradients in `lib/core/theme/app_theme.dart`

### Sugar Tracking System
- Core service: `SugarTrackingService` with in-memory state
- Integrates with OpenFoodFacts API for product data
- Tracks daily sugar intake against WHO recommended limits (25g default)
- Status levels: green (0-70%), yellow (70-90%), red (90-100%), over limit (100%+)

### Logging Architecture
- Structured logging via `AppLogger` in `lib/core/services/logger_service.dart`
- Categories: API, state changes, user actions, sugar tracking, errors
- Use appropriate log methods: `logApi()`, `logState()`, `logUserAction()`, etc.

### Code Generation Requirements
- Provider files need corresponding `.g.dart` files
- Run build_runner after modifying any `@riverpod` providers
- Check for `.g.dart` imports in provider files

### OpenFoodFacts Integration
- Barcode scanning returns `ProductInfo` models
- Sugar content calculated per 100g basis
- Service handles API calls and data transformation
- @CLAUDE.md