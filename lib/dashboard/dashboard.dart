import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/domain/ambee_api/mappers/pollen_to_gauge_mapper.dart';
import 'package:pollen_meter/core_ui/pollen_concentration_gauge.dart';
import 'package:pollen_meter/dashboard/presentation/high_pollen_level_alert.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pollen_meter/main.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';

import '../core/utils/logger.dart';
import '../core_ui/models/gauge/gauge_model.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollenLogic = ref.watch(
      pollenDataProvider(
        Coordinates(43.414192, 39.950547),
      ),
    ); //TODO: get coordinates from location
    final auxiliaryGaugeLogic = ref.watch(
      auxiliaryGaugeLogicProvider(
        Coordinates(43.414192, 39.950547),
      ),
    );
    late final List<GaugeModel>? gaugeModelAuxiliary = auxiliaryGaugeLogic.when(
      data: (data) {
        Logger.log(data.toString());
        return data.pollenData
            .toGaugeModelsAuxiliary(context, ref, data.profileData);
      },
      error: (error, stackTrace) {
        Logger.log(error.toString());
        return List<GaugeModel>.empty();
      },
      loading: () => List<GaugeModel>.empty(),
    );

    late final GaugeModel gaugeModelMain;

    pollenLogic.whenData(
      (value) {
        gaugeModelMain = value.toGaugeModelMain(context);
      },
    );

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 70),
            pollenLogic.when(
              data: (data) => PollenConcentrationGauge(
                data: gaugeModelMain,
              ),
              error: (error, stackTrace) => Text(
                error.toString(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            const SizedBox(height: 20),
            pollenLogic.when(
              data: (data) => (gaugeModelMain.title == 'High' ||
                      gaugeModelMain.title == 'Very High')
                  ? HighPollenLevelAlert(
                      msg: AppLocalizations.of(context)?.alert ?? 'Error')
                  : const SizedBox.shrink(),
              error: (error, stackTrace) => Text(
                error.toString(),
              ),
              loading: () => const SizedBox(height: 20),
            ),
            SizedBox(
              height: 125,
              child: ListView.separated(
                itemCount: gaugeModelAuxiliary?.length ?? 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    auxiliaryGaugeLogic.when(
                  data: (data) {
                    Logger.log(gaugeModelAuxiliary.toString());
                    return gaugeModelAuxiliary
                        ?.map(
                          (e) => PollenConcentrationGauge(
                            data: e,
                          ),
                        )
                        .toList()[index];
                  },
                  error: (error, stackTrace) {
                    Logger.log(error.toString());
                    return Text(
                      error.toString(),
                    );
                  },
                  loading: () {
                    Logger.log("loading...");
                    return const SizedBox.shrink();
                  },
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
