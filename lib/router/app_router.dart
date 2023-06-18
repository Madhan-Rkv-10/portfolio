import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madhan_portfolio/screens/project_details.dart';
import '../main.dart';
import '../responsive/mobile_Screen.dart';
import '../responsive/web_screen.dart';
import '../screens/homescreen.dart';
import '../screens/contacts.dart';
import '../screens/projects.dart';
import '../ui_utils/responsive_layout.dart';

enum AppRoute {
  home,
  projectDetails,
  webProjectDetails,
  about,
  contact,
  aboutDetails,
  contactDetails,
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    /// Application shell
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(
              child: child,
            ),
            webScreenLayout: WebScreenLayout(child: child));
      },
      routes: <RouteBase>[
        /// The first screen to display in the bottom navigation bar.
        GoRoute(
          path: '/home',
          name: AppRoute.home.name,
          builder: (BuildContext context, GoRouterState state) {
            return const ScreenA();
          },
          routes: [
            GoRoute(
              name: AppRoute.webProjectDetails.name,
              path: 'wProjectDetails/:id',
              builder: (BuildContext context, GoRouterState state) {
                return ProjectDetails(
                  id: state.pathParameters['id']!,
                  title: state.queryParameters['title'] ?? '',
                );
              },
            ),
          ],
        ),

        /// Displayed when the second item in the the bottom navigation bar is
        /// selected.
        GoRoute(
          path: '/projects',
          name: AppRoute.about.name,
          builder: (BuildContext context, GoRouterState state) {
            return const ScreenB();
          },
          routes: <RouteBase>[
            // The details screen to display stacked on the inner Navigator.
            // This will cover screen A but not the application shell.
            GoRoute(
              name: AppRoute.projectDetails.name,
              path: 'projectDetails/:id',
              builder: (BuildContext context, GoRouterState state) {
                return ProjectDetails(
                  id: state.pathParameters['id']!,
                  title: state.queryParameters['title'] ?? '',
                );
              },
            ),
          ],
        ),

        /// The third screen to display in the bottom navigation bar.
        GoRoute(
          path: '/profile',
          name: AppRoute.contact.name,
          builder: (BuildContext context, GoRouterState state) {
            return const ScreenC();
          },
          routes: <RouteBase>[
            // The details screen to display stacked on the inner Navigator.
            // This will cover screen A but not the application shell.
            GoRoute(
              path: 'details',
              name: AppRoute.contactDetails.name,
              builder: (BuildContext context, GoRouterState state) {
                return const DetailsScreen(label: 'C');
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
