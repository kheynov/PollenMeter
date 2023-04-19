import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pollen_meter/core/domain/ambee_api/mappers/pollen_to_pollenui_mapper.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/dashboard/presentation/high_pollen_level_alert.dart';
import 'package:pollen_meter/main.dart';
import 'package:pollen_meter/core/extensions/theme_colors_build_context.dart';
import '../../core/domain/profile/enums/risk_level.dart';
import '../../core/utils/blobs.dart';
import '../../core/utils/logger.dart';
import '../../core_ui/pollen/models/pollen_ui_model.dart';
import 'clip_shadow_path.dart';
import 'dashboard_tile.dart';

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
                        child: const Icon(Icons.person),
                      ),
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
                        child: ClipShadowPath(
                          clipper: BlobClipper(
                            id: getRandomID(),
                          ),
                          shadow: Shadow(
                            blurRadius: 40,
                            color: context.fromRiskLevel(
                              context.fromPollenLevelUnlocalized(
                                allergenType: pollenUIModelBasic.allergenType!,
                                count: pollenUIModelBasic.value.toInt(),
                              ),
                            ),
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) => Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: context.gradientFromRiskLevel(
                                    context.fromPollenLevelUnlocalized(
                                      allergenType:
                                          pollenUIModelBasic.allergenType!,
                                      count: pollenUIModelBasic.value.toInt(),
                                    ),
                                  ),
                                ),
                              ),
                              height: constraints.biggest.shortestSide,
                              width: constraints.biggest.shortestSide,
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      constraints.biggest.shortestSide * 1 / 3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        pollenUIModelBasic.value
                                            .toStringAsFixed(0),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)?.unit ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ],
                                  ),
                                  Text(
                                      context.fromPollenLevel(
                                        allergenType:
                                            pollenUIModelBasic.allergenType!,
                                        count: pollenUIModelBasic.value.toInt(),
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ],
                              ),
                            ),
                          ),
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
                                .map((e) => DashboardTileWidget(
                                    image: const Icon(Icons.abc),
                                    text: "Text",
                                    onTap: (e) {}))
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
