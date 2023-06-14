import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WebScreenLayout extends HookConsumerWidget {
  final Widget child;
  const WebScreenLayout({
    required this.child,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
    );
  }
}
