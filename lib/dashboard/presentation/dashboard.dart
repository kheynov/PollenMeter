import 'package:blobs/blobs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pollen_meter/core/domain/ambee_api/mappers/pollen_to_pollenui_mapper.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/dashboard/presentation/high_pollen_level_alert.dart';
import 'package:pollen_meter/main.dart';
import 'package:pollen_meter/core/extensions/theme_colors_build_context.dart';

import '../../core/domain/profile/enums/risk_level.dart';
import '../../core/utils/logger.dart';
import '../../core_ui/pollen/models/pollen_ui_model.dart';
import 'dashboard_tile.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FirebaseAuth instance = FirebaseAuth.instance;
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
    BlobController blobCtrl = BlobController();
    Blob.animatedRandom(
      size: 200,
      edgesCount: 5,
      minGrowth: 4,
      controller: blobCtrl,
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(DateFormat('MMMMd').format(DateTime.now()),
                            style: Theme.of(context).textTheme.displayMedium),
                        GestureDetector(
                          onTap: () {
                            if (instance.currentUser == null) {
                              context.push('/login');
                            } else {
                              context.push('/profile');
                            }
                          },
                          child: const Icon(Icons.person_outline),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(context.loc.greetingsMessage,
                            style: Theme.of(context).textTheme.titleMedium),
                        GestureDetector(
                          onTap: () {
                            context.push('/statistics');
                          },
                          child: const Icon(Icons.info_outline),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    pollenUILogic.when(
                      data: (data) => GestureDetector(
                        child: Center(
                          child: LayoutBuilder(
                            builder: (context, constraints) =>
                                Blob.animatedRandom(
                              duration: const Duration(seconds: 10),
                              size: constraints.biggest.shortestSide * 9 / 10,
                              loop: true,
                              styles: BlobStyles(
                                color: context.fromRiskLevel(
                                  context.fromPollenLevelUnlocalized(
                                    allergenType:
                                        pollenUIModelBasic.allergenType!,
                                    count: pollenUIModelBasic.value.toInt(),
                                  ),
                                ),
                                gradient: LinearGradient(
                                  colors: context.gradientFromRiskLevel(
                                    context.fromPollenLevelUnlocalized(
                                      allergenType:
                                          pollenUIModelBasic.allergenType!,
                                      count: pollenUIModelBasic.value.toInt(),
                                    ),
                                  ),
                                ).createShader(
                                  Rect.fromLTRB(
                                      0,
                                      0,
                                      constraints.biggest.shortestSide * 9 / 10,
                                      constraints.biggest.shortestSide *
                                          9 /
                                          10),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                      textAlign: TextAlign.center,
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
                    SizedBox(
                      height: 125,
                      child: ListView.separated(
                        itemCount: pollenUIModelsWithPrefs.length,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            pollenUILogic.when(
                          data: (data) {
                            return pollenUIModelsWithPrefs
                                .map(
                                  (e) => AspectRatio(
                                    aspectRatio: 119 / 113,
                                    child: DashboardTileWidget(
                                      image: Container(
                                        height: 28,
                                        width: 28,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: e.color,
                                          boxShadow: [
                                            BoxShadow(
                                              color: e.color.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                      ),
                                      text: e.title,
                                      onTap: (e) {},
                                      value: e.value.toStringAsFixed(0),
                                      units: context.loc.unit,
                                    ),
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
                    const SizedBox(height: 40),
                    pollenUILogic.when(
                      data: (data) {
                        switch (context.fromPollenLevelUnlocalized(
                            allergenType: pollenUIModelBasic.allergenType!,
                            count: pollenUIModelBasic.value.toInt())) {
                          case RiskLevel.low:
                            return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: HighPollenLevelAlert(
                                    msg: context.loc.alertLow, emoticon: "🎉"));
                          case RiskLevel.moderate:
                            return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: HighPollenLevelAlert(
                                    msg: context.loc.alertModerate,
                                    emoticon: "⚠️"));
                          case RiskLevel.high:
                            return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: HighPollenLevelAlert(
                                    msg: context.loc.alertHigh, emoticon: "❌"));
                          case RiskLevel.veryHigh:
                            return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: HighPollenLevelAlert(
                                    msg: context.loc.alertVeryHigh,
                                    emoticon: "💀"));
                          default:
                            return const SizedBox.shrink();
                        }
                      },
                      error: (error, stackTrace) => Text(
                        error.toString(),
                      ),
                      loading: () => const SizedBox(height: 20),
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
