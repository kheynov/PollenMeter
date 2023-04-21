import 'package:flutter/material.dart';
import 'package:pollen_meter/dashboard/presentation/dashboard.dart';
import 'package:pollen_meter/diary/presentation/diary_page.dart';
import 'package:pollen_meter/test/test_routes.dart';

import '../../core_ui/bottom_nav_bar.dart';

class BottomNavBarNavigator extends StatefulWidget {
  const BottomNavBarNavigator({Key? key}) : super(key: key);
  @override
  State createState() => _BottomNavBarNavigatorState();
}

class _BottomNavBarNavigatorState extends State<BottomNavBarNavigator>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: TabBarView(
        controller: tabController,
        children: const [
          DashboardPage(),
          DiaryPage(),
          MyHomePageTest2(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(tabController: tabController),
    );
  }
}
