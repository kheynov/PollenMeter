import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
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
      pollenUIModelsEverything =
          data.pollenData.toPollenUIModelsEverything(context);
    }, error: (error, stackTrace) {
      Logger.log("Error: $error");
      Logger.log("StackTrace: ${stackTrace.toString()}");
      pollenUIModelsEverything = List<PollenUIModel>.empty();
    }, loading: () {
      pollenUIModelsEverything = List<PollenUIModel>.empty();
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    height: 50,
                    shape: const CircleBorder(),
                    color: Colors.green,
                    onPressed: () {
                      context.pop();
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Text("Статистика")
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GroupButton(
              onSelected: (dynamic, index, isSelected) {
                _tabController.animateTo(index);
                return true;
              },
              isRadio: true,
              buttons: [
                AllergenType.tree,
                AllergenType.grass,
                AllergenType.weed
              ].map((e) => context.fromAllergenType(e)).toList(),
            ),
            SizedBox(
              height: 2000,
              child: TabBarView(
                  //TODO: this is bad...
                  controller: _tabController,
                  children: [
                    Column(
                      children: pollenUIModelsEverything
                          .where((element) =>
                              element.allergenType == AllergenType.tree)
                          .map((e) =>
                              StatisticPollenTileWidget(statisticModel: e))
                          .toList(),
                    ),
                    Column(
                      children: pollenUIModelsEverything
                          .where((element) =>
                              element.allergenType == AllergenType.grass)
                          .map((e) =>
                              StatisticPollenTileWidget(statisticModel: e))
                          .toList(),
                    ),
                    Column(
                      children: pollenUIModelsEverything
                          .where((element) =>
                              element.allergenType == AllergenType.weed)
                          .map((e) =>
                              StatisticPollenTileWidget(statisticModel: e))
                          .toList(),
                    ),
                  ] //pollenUIModelsEverything.map((e) => StatisticPollenTileWidget(statisticModel: e)).toList(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
