import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madhan_portfolio/router/app_router.dart';
import 'package:madhan_portfolio/screens/homescreen.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:madhan_portfolio/screens/contacts.dart';
import 'package:madhan_portfolio/screens/projects.dart';

import 'package:madhan_portfolio/ui_utils/responsive_layout.dart';
import 'package:madhan_portfolio/utils/src/colors/app_theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: ShellRouteExampleApp()));
}

class ShellRouteExampleApp extends StatelessWidget {
  ShellRouteExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Madhan',
      // routerConfig: goRouter,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      routeInformationProvider: goRouter.routeInformationProvider,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Text(
          'Details for $label',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
