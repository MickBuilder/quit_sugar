// lib/main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/core/router/app_router.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';
import 'package:quit_suggar/core/services/logger_service.dart';
import 'package:quit_suggar/core/services/revenuecat_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppLogger.info('App starting up');

  // Initialize RevenueCat
  await RevenueCatService.initialize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLogger.info('Building MyApp widget');

    final router = ref.watch(appRouter);

    return ShadApp.custom(
      darkTheme: AppTheme.darkTheme,
      appBuilder: (context) {
        AppLogger.info('Building CupertinoApp.router');

        return CupertinoApp.router(
          theme: CupertinoTheme.of(context),
          localizationsDelegates: [
            DefaultMaterialLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          builder: (context, child) {
            return ShadAppBuilder(child: child!);
          },
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
