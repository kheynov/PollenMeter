import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/domain/ambee_api/mappers/pollen_to_pollenui_mapper.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';
import 'package:pollen_meter/core_ui/gauge.dart';
import 'package:pollen_meter/dashboard/presentation/high_pollen_level_alert.dart';
import 'package:pollen_meter/main.dart';

import '../../core/domain/profile/enums/risk_level.dart';
import '../../core/utils/logger.dart';
import '../../core_ui/pollen/models/pollen_ui_model.dart';
import '../../pollen_statistics/widgets/statistic_pollen_tile_widget.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollenLogic = ref.watch(
      pollenDataProvider(
        Coordinates(40.506036, -3.740210),
      ),
    ); //TODO: get coordinates from location
    final auxiliaryGaugeLogic = ref.watch(
      auxiliaryGaugeLogicProvider(
        Coordinates(40.506036, -3.740210),
      ),
    );
    final List<PollenUIModel> gaugeModelAuxiliary = auxiliaryGaugeLogic.when(
      data: (data) {
        //TODO: исправить, когда будет исправлен PollenToGaugeMapper
        final ultraData = data.pollenData
            .toPollenUIModelsWithPrefs(context, ref, data.profileData);
        Logger.log(ultraData.toString());
        return ultraData;
      },
      error: (error, stackTrace) {
        Logger.log("Error: $error");
        Logger.log("StackTrace: ${stackTrace.toString()}");
        return List<PollenUIModel>.empty();
      },
      loading: () => List<PollenUIModel>.empty(),
    );
    final List<PollenUIModel> statisticPollens = pollenLogic.when(
      data: (data) {
        Logger.log(data.toString());
        return data.toPollenUIModelsEverything(context);
      },
      error: (error, stackTrace) {
        Logger.log(error.toString());
        return List<PollenUIModel>.empty();
      },
      loading: () => List<PollenUIModel>.empty(),
    );
    late final PollenUIModel gaugeModelMain;

    pollenLogic.whenData(
      (value) {
        gaugeModelMain = value.toPollenModelBasic(context);
      },
    );

    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: 5 + statisticPollens.length,
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return const SizedBox(height: 70);
              case 1:
                return pollenLogic.when(
                  data: (data) => Gauge(
                    data: gaugeModelMain,
                  ),
                  error: (error, stackTrace) => Text(
                    error.toString(),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case 2:
                return const SizedBox(height: 20);
              case 3:
                return pollenLogic.when(
                  data: (data) => (context.fromPollenLevelUnlocalized(
                                  allergenType: gaugeModelMain.allergenType!,
                                  count: gaugeModelMain.value.toInt()) ==
                              RiskLevel.high ||
                          context.fromPollenLevelUnlocalized(
                                  allergenType: gaugeModelMain.allergenType!,
                                  count: gaugeModelMain.value.toInt()) ==
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
                    itemCount: gaugeModelAuxiliary.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        auxiliaryGaugeLogic.when(
                      data: (data) {
                        return gaugeModelAuxiliary
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
                        statisticModel: statisticPollens[index - 5]));
            }
          },
        ),
      ),
    );
  }
}
