# Quit Sugar - Project Structure

A comprehensive sugar addiction recovery app with both mobile application and landing page.

## 📁 Project Structure

```
quit_suggar/
├── app/                    # Flutter Mobile Application
│   ├── lib/               # Flutter source code
│   ├── android/           # Android platform files
│   ├── ios/               # iOS platform files
│   ├── pubspec.yaml       # Flutter dependencies
│   └── CLAUDE.md          # Flutter development guidelines
│
├── landing/               # Next.js Landing Page
│   ├── app/               # Next.js App Router pages
│   │   ├── page.tsx       # Homepage
│   │   ├── blog/          # Blog section
│   │   ├── privacy/       # Privacy Policy & Terms
│   │   ├── layout.tsx     # Root layout
│   │   └── globals.css    # Global styles
│   ├── components/        # Reusable components
│   │   └── ui/            # shadcn/ui components
│   ├── lib/               # Utilities
│   ├── public/            # Static assets
│   ├── package.json       # Node.js dependencies
│   └── README.md          # Landing page documentation
│
└── PROJECT_README.md      # This file
```

## 🚀 Getting Started

### Flutter Mobile App
Navigate to the `app/` directory:
```bash
cd app/
flutter pub get
flutter run
```

### Next.js Landing Page
Navigate to the `landing/` directory:
```bash
cd landing/
npm install
npm run dev
```

## 🎨 Design System

### Mobile App (Flutter)
- **Theme**: Dark-focused with calming blues and supportive colors
- **Architecture**: Clean Architecture with Riverpod state management
- **Key Features**: Sugar tracking, barcode scanning, progress visualization

### Landing Page (Next.js)
- **Design**: Minimal, dark theme similar to Rise app
- **Framework**: Next.js 15 with App Router
- **UI Components**: shadcn/ui with Tailwind CSS
- **Features**: Responsive design, SEO optimized, static generation

## 📱 Key Features

### Mobile App Features
- Sugar intake tracking with WHO guidelines
- Barcode scanning for products
- Progress visualization with calming UI
- Streak tracking and motivation
- Clean, supportive design for addiction recovery

### Landing Page Features  
- Hero section with app showcase
- Mobile app download buttons
- Privacy Policy and Terms of Service
- Blog section (coming soon)
- Responsive design
- SEO optimized

## 🛠 Development

### Mobile App Commands
```bash
# Run the app
flutter run

# Generate code (Riverpod providers)
dart run build_runner build

# Run tests
flutter test

# Static analysis
flutter analyze
```

### Landing Page Commands
```bash
# Development server
npm run dev

# Build for production
npm run build

# Start production server
npm start

# Add new shadcn/ui components
npx shadcn@latest add [component-name]
```

## 🌟 Tech Stack

### Mobile App
- **Framework**: Flutter
- **State Management**: Riverpod with code generation
- **Architecture**: Clean Architecture
- **UI**: shadcn_ui with Material 3 theming
- **Navigation**: go_router
- **Scanning**: mobile_scanner
- **API**: OpenFoodFacts integration

### Landing Page
- **Framework**: Next.js 15
- **UI**: shadcn/ui + Tailwind CSS
- **Routing**: App Router
- **Icons**: Lucide React
- **Build**: Turbopack
- **Deployment**: Static Export ready

## 📄 Pages

### Landing Page Routes
- `/` - Homepage with app showcase
- `/blog` - Blog section (coming soon content)
- `/privacy` - Privacy Policy and Terms of Service

## 🎯 Focus Areas

Both applications are designed with sugar addiction recovery in mind:
- **Calming visual design** to reduce anxiety
- **Supportive messaging** rather than judgmental
- **Minimal distractions** to maintain focus
- **Progress-focused** rather than restriction-focused
- **Evidence-based** approach with WHO guidelines

## 📈 Future Enhancements

- App Store and Google Play deployment
- Blog content management system  
- Advanced analytics and insights
- Social features and community support
- Integration with health apps
- Multi-language support

---

Built with ❤️ for health and wellness