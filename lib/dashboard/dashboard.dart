import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollen_meter/core/domain/ambee_api/mappers/pollen_to_gauge_mapper.dart';
import 'package:pollen_meter/core_ui/pollen_concentration_gauge.dart';
import 'package:pollen_meter/dashboard/presentation/high_pollen_level_alert.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pollen_meter/main.dart';
import 'package:pollen_meter/core/utils/coordinates.dart';

import '../core/domain/profile/model/profile_data_model.dart';
import '../core_ui/models/gauge/gauge_model.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollenLogic = ref.watch(
      pollenDataProvider(
        Coordinates(45, 47),
      ),
    ); //TODO: get coordinates from location
    late final GaugeModel gaugeModelMain;
    List<GaugeModel>? gaugeModelAuxiliary;

    pollenLogic.whenData(
      (value) {
        gaugeModelMain = value.toGaugeModelMain(context);
        gaugeModelAuxiliary = value.toGaugeModelsAuxiliary(
            context, ref, ProfileDataModel(true, []));
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
                itemCount: gaugeModelAuxiliary?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    pollenLogic.when(
                  data: (data) => gaugeModelAuxiliary
                      ?.map(
                        (e) => PollenConcentrationGauge(
                          data: e,
                        ),
                      )
                      .toList()[index],
                  error: (error, stackTrace) => Text(
                    error.toString(),
                  ),
                  loading: () => const SizedBox.shrink(),
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
