import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pollen_meter/core/domain/ambee_api/mappers/pollen_to_pollenui_mapper.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/main.dart';
import 'package:pollen_meter/pollen_statistics/widgets/statistic_pollen_tile_widget.dart';
import '../../core/domain/profile/enums/allergen_type.dart';
import '../../core/utils/logger.dart';
import '../../core_ui/pollen/models/pollen_ui_model.dart';
import 'package:group_button/group_button.dart';

class StatisticsPage extends ConsumerStatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends ConsumerState<StatisticsPage>
    with SingleTickerProviderStateMixin {
  late GroupButtonController _tabController;
  late TabController _properTabController;
  late bool isDescendingOrder = true;
  @override
  void initState() {
    super.initState();
    isDescendingOrder = true;
    _properTabController = TabController(vsync: this, length: 3);
    _tabController = GroupButtonController(selectedIndex: 0);
    _properTabController.addListener(() {
      _tabController.selectIndex(_properTabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pollenUILogic = ref.watch(
      pollenUILogicProvider,
    );
    late final List<PollenUIModel>
        pollenUIModelsEverything; //for the bottom stats;
    //includes everything
    pollenUILogic.when(data: (data) {
      if (isDescendingOrder) {
        pollenUIModelsEverything =
            data.pollenData.toPollenUIModelsEverything(context);
      } else {
        pollenUIModelsEverything = data.pollenData
            .toPollenUIModelsEverything(context)
            .reversed
            .toList();
      }
    }, error: (error, stackTrace) {
      Logger.log("Error: $error");
      Logger.log("StackTrace: ${stackTrace.toString()}");
      pollenUIModelsEverything = List<PollenUIModel>.empty();
    }, loading: () {
      pollenUIModelsEverything = List<PollenUIModel>.empty();
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 10),
                    Text(
                        DateFormat('MMMMd').format(
                          DateTime.now(),
                        ),
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GroupButton(
                controller: _tabController,
                onSelected: (dynamic, index, isSelected) {
                  _properTabController.animateTo(index);
                  return true;
                },
                options: GroupButtonOptions(
                  borderRadius: BorderRadius.circular(15),
                  unselectedColor: Theme.of(context).colorScheme.secondary,
                  selectedShadow: [],
                  unselectedShadow: [],
                ),
                isRadio: true,
                buttons: [
                  AllergenType.tree,
                  AllergenType.grass,
                  AllergenType.weed
                ].map((e) => context.fromAllergenType(e)).toList(),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                child: Text(
                    '${context.loc.sortedByRiskLevel} ${isDescendingOrder ? '↓' : '↑'}'),
                onTap: () {
                  isDescendingOrder = !isDescendingOrder;
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TabBarView(controller: _properTabController, children: [
                  ListView(
                    children: pollenUIModelsEverything
                        .where((element) =>
                            element.allergenType == AllergenType.tree)
                        .map((e) => [
                              StatisticPollenTileWidget(statisticModel: e),
                              const SizedBox(height: 12)
                            ])
                        .expand((i) => i)
                        .toList(),
                  ),
                  ListView(
                    children: pollenUIModelsEverything
                        .where((element) =>
                            element.allergenType == AllergenType.grass)
                        .map((e) => [
                              StatisticPollenTileWidget(statisticModel: e),
                              const SizedBox(height: 12)
                            ])
                        .expand((i) => i)
                        .toList(),
                  ),
                  ListView(
                    children: pollenUIModelsEverything
                        .where((element) =>
                            element.allergenType == AllergenType.weed)
                        .map((e) => [
                              StatisticPollenTileWidget(statisticModel: e),
                              const SizedBox(height: 12)
                            ])
                        .expand((i) => i)
                        .toList(),
                  ),
                ] //pollenUIModelsEverything.map((e) => StatisticPollenTileWidget(statisticModel: e)).toList(),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
