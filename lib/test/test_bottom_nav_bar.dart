import 'dart:developer';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestBottomNavBar extends StatelessWidget {
  const TestBottomNavBar({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        activeColor: Theme.of(context).colorScheme.secondaryContainer,
        color: Theme.of(context).colorScheme.surface,
        height: 70,
        initialActiveIndex: 0,
        top: -20,
        curveSize: 120,
        onTap: (int i) {
          switch (i) {
            case 0:
              context.go('/dashboard');
              break;
            case 1:
              context.go('/record');
              break;
            case 2:
              context.go('/calendar');
              break;
          }
          log('click index=$i');
        },
        items: const [
          TabItem(icon: Icons.explore),
          TabItem(icon: Icons.edit),
          TabItem(icon: Icons.assignment)
        ],
      ),
    );
  }
}
