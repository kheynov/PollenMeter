import 'package:flutter/material.dart';
import 'package:pollen_meter/dashboard/dashboard.dart';
import 'package:pollen_meter/test/test_routes.dart';

import '../core_ui/bottom_nav_bar.dart';

class MyHomePageTestBNB extends StatefulWidget {
  const MyHomePageTestBNB({Key? key}) : super(key: key);
  @override
  State createState() => _MyHomePageTestBNBState();
}

class _MyHomePageTestBNBState extends State<MyHomePageTestBNB>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          DashboardPage(),
          MyHomePageTest2(),
          MyHomePageTest3(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(tabController: tabController),
    );
  }
}
