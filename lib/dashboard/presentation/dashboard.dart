import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pollen_meter/core/domain/ambee_api/mappers/pollen_to_pollenui_mapper.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/core_ui/gauge.dart';
import 'package:pollen_meter/dashboard/presentation/high_pollen_level_alert.dart';
import 'package:pollen_meter/main.dart';

import '../../core/domain/profile/enums/risk_level.dart';
import '../../core/utils/logger.dart';
import '../../core_ui/pollen/models/pollen_ui_model.dart';

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
    pollenUILogic.when(data: (data) {
      pollenUIModelsWithPrefs =
          data.pollenData.toPollenUIModelsWithPrefs(context, data.profileData);
      pollenUIModelBasic = data.pollenData.toPollenModelBasic(context);
    }, error: (error, stackTrace) {
      Logger.log("Error: $error");
      Logger.log("StackTrace: ${stackTrace.toString()}");
      pollenUIModelsWithPrefs = List<PollenUIModel>.empty();
    }, loading: () {
      pollenUIModelsWithPrefs = List<PollenUIModel>.empty();
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("12 апреля"),
                          Text("Добрый вечер, Егор)"),
                        ],
                      ),
                      MaterialButton(
                          onPressed: () {
                            context.push('/profile');
                          },
                          color: Colors.green,
                          shape: const CircleBorder(),
                          height: 50,
                          child: const Icon(Icons.person)),
                    ],
                  )),
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox.shrink(),
                    // return Container(
                    //   padding: const EdgeInsets.all(20),
                    //   alignment: Alignment.centerRight,
                    //   child: MaterialButton(
                    //     onPressed: () {
                    //       context.go('/profile');
                    //     },
                    //     color: Colors.green,
                    //     shape: const CircleBorder(),
                    //     child: const Icon(Icons.person),
                    //   ),
                    // );
                    pollenUILogic.when(
                      data: (data) => InkWell(
                        child: Gauge(
                          data: pollenUIModelBasic,
                        ),
                        onTap: () {
                          context.push('/statistics');
                        },
                      ),
                      error: (error, stackTrace) => Text(
                        error.toString(),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    pollenUILogic.when(
                      data: (data) => (context.fromPollenLevelUnlocalized(
                                      allergenType:
                                          pollenUIModelBasic.allergenType!,
                                      count:
                                          pollenUIModelBasic.value.toInt()) ==
                                  RiskLevel.high ||
                              context.fromPollenLevelUnlocalized(
                                      allergenType:
                                          pollenUIModelBasic.allergenType!,
                                      count:
                                          pollenUIModelBasic.value.toInt()) ==
                                  RiskLevel.veryHigh)
                          ? HighPollenLevelAlert(
                              msg: AppLocalizations.of(context)?.alert ??
                                  'Error')
                          : const SizedBox.shrink(),
                      error: (error, stackTrace) => Text(
                        error.toString(),
                      ),
                      loading: () => const SizedBox(height: 20),
                    ),

                    SizedBox(
                      height: 125,
                      child: ListView.separated(
                        itemCount: pollenUIModelsWithPrefs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            pollenUILogic.when(
                          data: (data) {
                            return pollenUIModelsWithPrefs
                                .map(
                                  (e) => InkWell(
                                    child: Gauge(
                                      data: e,
                                    ),
                                    onTap: () {
                                      context.push('/statistics');
                                    },
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
