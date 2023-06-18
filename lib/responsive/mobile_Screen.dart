import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../screens/contacts.dart';

class MobileScreenLayout extends HookConsumerWidget {
  final Widget child;

  const MobileScreenLayout({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Project',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Contact ',
          ),
        ],
        currentIndex: _calculateSelectedIndex(
            context, GoRouterState.of(context).location),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context, String location) {
    // return switch (location) { '/a' => 0, '/b' => 1, '/c' => 2, _ => 0 };
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/projects')) {
      return 1;
    }
    if (location.startsWith('/profile')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/projects');
        break;
      case 2:
        GoRouter.of(context).go('/profile');
        break;
    }
  }
}
