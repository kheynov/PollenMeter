import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'LEFT'),
    const Tab(text: 'RIGHT'),
  ];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      activeColor: Theme.of(context).colorScheme.secondaryContainer,
      color: Theme.of(context).colorScheme.surface,
      items: const [
        TabItem(icon: Icons.explore),
        TabItem(icon: Icons.edit),
        TabItem(icon: Icons.assignment)
      ],
      controller: _tabController,
    );
  }
}
