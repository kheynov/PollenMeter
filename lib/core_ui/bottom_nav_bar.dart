import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IconButton(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    child: SvgPicture.asset(
                        'assets/images/pollen/perekrestok.svg',
                        color: (selectedIndex == 0)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.loc.dashboardPage,
                    style: (selectedIndex == 0)
                        ? Theme.of(context).textTheme.labelLarge
                        : Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                  widget.tabController.animateTo(0);
                });
              },
            ),
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(26)),
                    color: Theme.of(context).colorScheme.primary,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 12,
                          color: Theme.of(context).colorScheme.primary)
                    ],
                  ),
                  height: 44,
                  width: 44,
                  child: Icon(Icons.add,
                      color: Theme.of(context).textTheme.displayLarge!.color,
                      size: 30),
                ),
                onTap: () {
                  context.push('/profile');
                }, //TODO: replace with record
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.calendar_month,
                      size: 20,
                      color: (selectedIndex == 1)
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outline),
                  Text(
                    context.loc.diaryPage,
                    style: (selectedIndex == 1)
                        ? Theme.of(context).textTheme.labelLarge
                        : Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              onPressed: () {
                setState(
                  () {
                    selectedIndex = 1;
                    widget.tabController.animateTo(1);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
