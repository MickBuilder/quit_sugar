# Quit Sugar - Sugar Addiction Recovery App

A gamified mobile application designed to help users break free from sugar addiction by tracking daily sugar intake through product scanning and food image recognition, built with Flutter and Supabase.

## Concept Overview

Quit Sugar is a health-focused mobile app that combines the functionality of apps like Yuka and OpenFoodFacts, but specifically targets sugar addiction recovery. The app helps users gradually reduce their sugar consumption below recommended daily limits until they can eliminate it entirely.

### Core Features (MVP)

1. **Product Scanning**: Scan barcodes to get sugar content from OpenFoodFacts database
2. **Food Image Recognition**: Estimate sugar content from photos of homemade foods
3. **Daily Sugar Tracking**: Monitor daily sugar intake with visual progress indicators
4. **Gamification**: Achievements, streaks, and progress milestones
5. **Educational Content**: Tips and information about sugar reduction
6. **Monetization**: Premium features and subscription model

### App Flow Example

1. **Onboarding**: User sets daily sugar limit goal
2. **Daily Tracking**: 
   - Scan product barcode → Get sugar content → Add to daily log
   - Take photo of food → AI estimates sugar → Add to daily log
3. **Progress Dashboard**: Visual representation of daily progress
4. **Achievements**: Unlock badges for milestones (7-day streak, under daily limit, etc.)
5. **Insights**: Weekly/monthly reports on sugar reduction progress

## Architecture

This project follows Clean Architecture principles with clear separation between:
- **Presentation Layer**: UI, Widgets, State Management (Riverpod)
- **Domain Layer**: Entities, Use Cases, Repository Interfaces
- **Data Layer**: Data Sources, Models, Repository Implementations

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── utils/
│   └── theme/
├── features/
│   ├── auth/
│   ├── profile/
│   ├── scanning/
│   ├── tracking/
│   ├── achievements/
│   └── insights/
├── shared/
│   ├── widgets/
│   ├── providers/
│   └── services/
└── main.dart
```

## Getting Started

### Prerequisites

- Flutter 3.x or higher
- Dart SDK
- Supabase account (for backend services)
- OpenFoodFacts API access (for product database)

### Setup

1. **Clone the repository**
   ```bash
   git clone [repository-url]
   cd quit_suggar
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Supabase**
   
   Create a `.env` file based on `.env.example`:
   ```
   SUPABASE_URL=your_supabase_project_url
   SUPABASE_ANON_KEY=your_supabase_anon_key
   OPENFOODFACTS_API_URL=https://world.openfoodfacts.org/api/v0
   ```

4. **Run the app**
   
   For development with environment variables:
   ```bash
   flutter run --dart-define=SUPABASE_URL=your_url --dart-define=SUPABASE_ANON_KEY=your_key
   ```

   For iOS:
   ```bash
   flutter run -d ios --dart-define=SUPABASE_URL=your_url --dart-define=SUPABASE_ANON_KEY=your_key
   ```

   For Android:
   ```bash
   flutter run -d android --dart-define=SUPABASE_URL=your_url --dart-define=SUPABASE_ANON_KEY=your_key
   ```

## Features Roadmap

### Phase 1: Core Foundation 🎯
- [ ] Basic Flutter app setup with clean architecture
- [ ] Supabase integration and database schema
- [ ] User authentication and profile management
- [ ] Basic UI theme and navigation

### Phase 2: Core Features 🎯
- [ ] Product barcode scanning integration
- [ ] OpenFoodFacts API integration
- [ ] Daily sugar tracking functionality
- [ ] Basic progress visualization

### Phase 3: Advanced Features 🎯
- [ ] Food image recognition (AI/ML integration)
- [ ] Gamification system (achievements, streaks)
- [ ] Educational content and tips
- [ ] Weekly/monthly insights and reports

### Phase 4: Monetization 🎯
- [ ] Premium subscription features
- [ ] In-app purchases for advanced features
- [ ] App Store and Google Play Store integration
- [ ] Analytics and user engagement tracking

## Tech Stack

- **Flutter 3+**: Cross-platform mobile framework
- **Supabase**: Backend as a Service (PostgreSQL, Auth, Storage)
- **Riverpod**: State management
- **go_router**: Navigation
- **Material 3**: Design system
- **OpenFoodFacts API**: Product database for barcode scanning
- **TensorFlow Lite**: Food image recognition (future)
- **RevenueCat**: Subscription management (future)

## Database Schema (Planned)

```sql
-- Users table
profiles (
  id uuid primary key,
  email text unique,
  daily_sugar_limit numeric,
  created_at timestamp,
  updated_at timestamp
)

-- Daily tracking
daily_logs (
  id uuid primary key,
  user_id uuid references profiles(id),
  date date,
  total_sugar numeric,
  created_at timestamp
)

-- Food entries
food_entries (
  id uuid primary key,
  daily_log_id uuid references daily_logs(id),
  name text,
  sugar_content numeric,
  source_type text, -- 'scanned', 'photo', 'manual'
  barcode text,
  image_url text,
  created_at timestamp
)

-- Achievements
achievements (
  id uuid primary key,
  user_id uuid references profiles(id),
  type text,
  title text,
  description text,
  unlocked_at timestamp
)
```

## Monetization Strategy

### Freemium Model
- **Free Tier**: Basic tracking, limited scans per day, basic achievements
- **Premium Tier**: Unlimited scans, advanced analytics, personalized insights, ad-free experience

### Revenue Streams
1. **Monthly/Yearly Subscriptions**: $4.99/month or $39.99/year
2. **One-time Purchases**: Premium features, custom themes
3. **In-app Purchases**: Additional achievement packs, educational content

## Contributing

This project follows an iterative development approach. Each phase should:
1. Build upon the previous implementation
2. Be fully testable
3. Maintain clean architecture principles
4. Include proper documentation
5. Focus on user experience and health outcomes

## License

[Your License Here]

## Health Disclaimer

This app is designed to support healthy lifestyle changes and should not replace professional medical advice. Users should consult with healthcare providers before making significant dietary changes.
