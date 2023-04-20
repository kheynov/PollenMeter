import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.tabController});
  final TabController tabController;

  @override
  State createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.tabController.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(26), topRight: Radius.circular(26)),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(blurRadius: 4, color: Theme.of(context).shadowColor)
        ],
      ),
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Column(
              children: [
                Text(
                  "text",
                  style: (selectedIndex == 0)
                      ? Theme.of(context).textTheme.labelLarge
                      : Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            onTap: () {
              setState(() {
                selectedIndex = 0;
                widget.tabController.animateTo(0);
              });
            },
          ),
          GestureDetector(
            child: const Text("text"),
          ),
          GestureDetector(
            child: const Text("text"),
            onTap: () {
              setState(() {
                selectedIndex = 1;
                widget.tabController.animateTo(1);
              });
            },
          ),
        ],
      ),
    );
  }
}
