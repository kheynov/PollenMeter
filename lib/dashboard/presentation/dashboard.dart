import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/domain/ambee_api/mappers/pollen_to_pollenui_mapper.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/core_ui/gauge.dart';
import 'package:pollen_meter/dashboard/presentation/high_pollen_level_alert.dart';
import 'package:pollen_meter/main.dart';

import '../../core/domain/profile/enums/allergen.dart';
import '../../core/domain/profile/enums/risk_level.dart';
import '../../core/domain/profile/model/profile_data_model.dart';
import '../../core/utils/di.dart';
import '../../core/utils/logger.dart';
import '../../core_ui/pollen/models/pollen_ui_model.dart';
import '../../pollen_statistics/widgets/statistic_pollen_tile_widget.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollenUILogic = ref.watch(
      pollenUILogicProvider,
    );
    late final List<PollenUIModel>
        pollenUIModelsWithPrefs; //for the small gauges;
    // only includes data for allergens that are enabled in profile
    late final PollenUIModel
        pollenUIModelBasic; //for the big gauge; only uses average data by categories
    late final List<PollenUIModel>
        pollenUIModelsEverything; //for the bottom stats;
    //includes everything
    pollenUILogic.when(data: (data) {
      pollenUIModelsWithPrefs =
          data.pollenData.toPollenUIModelsWithPrefs(context, data.profileData);
      pollenUIModelsEverything =
          data.pollenData.toPollenUIModelsEverything(context);
      pollenUIModelBasic = data.pollenData.toPollenModelBasic(context);
    }, error: (error, stackTrace) {
      Logger.log("Error: $error");
      Logger.log("StackTrace: ${stackTrace.toString()}");
      pollenUIModelsEverything = List<PollenUIModel>.empty();
      pollenUIModelsWithPrefs = List<PollenUIModel>.empty();
    }, loading: () {
      pollenUIModelsEverything = List<PollenUIModel>.empty();
      pollenUIModelsWithPrefs = List<PollenUIModel>.empty();
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: ListView.builder(
          itemCount: 5 + pollenUIModelsWithPrefs.length,
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return const SizedBox(height: 70);
              case 1:
                return pollenUILogic.when(
                  data: (data) => Gauge(
                    data: pollenUIModelBasic,
                  ),
                  error: (error, stackTrace) {
                    final data = ProfileDataModel(ThemeTypes.dark, [
                      Allergen.alder,
                      Allergen.ash,
                      Allergen.birch,
                      Allergen.chenopod,
                      Allergen.cypress,
                      Allergen.elm,
                    ]);
                    ServiceLocator.profileDataRepository.saveProfile(data);
                    return Text(error.toString());
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case 2:
                return const SizedBox(height: 20);
              case 3:
                return pollenUILogic.when(
                  data: (data) => (context.fromPollenLevelUnlocalized(
                                  allergenType:
                                      pollenUIModelBasic.allergenType!,
                                  count: pollenUIModelBasic.value.toInt()) ==
                              RiskLevel.high ||
                          context.fromPollenLevelUnlocalized(
                                  allergenType:
                                      pollenUIModelBasic.allergenType!,
                                  count: pollenUIModelBasic.value.toInt()) ==
                              RiskLevel.veryHigh)
                      ? HighPollenLevelAlert(
                          msg: AppLocalizations.of(context)?.alert ?? 'Error')
                      : const SizedBox.shrink(),
                  error: (error, stackTrace) => Text(
                    error.toString(),
                  ),
                  loading: () => const SizedBox(height: 20),
                );
              case 4:
                return SizedBox(
                  height: 125,
                  child: ListView.separated(
                    itemCount: pollenUIModelsWithPrefs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        pollenUILogic.when(
                      data: (data) {
                        return pollenUIModelsWithPrefs
                            .map(
                              (e) => Gauge(
                                data: e,
                              ),
                            )
                            .toList()[index];
                      },
                      error: (error, stackTrace) {
                        return Text(
                          error.toString(),
                        );
                      },
                      loading: () {
                        return const SizedBox.shrink();
                      },
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 10),
                  ),
                );
              default:
                return SizedBox(
                    child: StatisticPollenTileWidget(
                        statisticModel: pollenUIModelsEverything[index - 5]));
            }
          },
        ),
      ),
    );
  }
}
