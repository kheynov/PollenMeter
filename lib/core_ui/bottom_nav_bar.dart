import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.tabController});
  final TabController tabController;
  @override
  State createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.fixed,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      activeColor: Theme.of(context).colorScheme.secondaryContainer,
      color: Theme.of(context).colorScheme.surface,
      items: const [
        TabItem(icon: Icons.explore),
        TabItem(icon: Icons.edit),
        TabItem(icon: Icons.assignment),
      ],
      controller: widget.tabController,
    );
  }
}
