import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/main.dart';
import 'package:pollen_meter/profile/presentation/widgets/pollen_selection.dart';
import 'package:pollen_meter/profile/domain/model/pollen_tile_model.dart';
import 'package:pollen_meter/profile/presentation/widgets/theme_selection.dart';
import '../../../core/domain/profile/enums/allergen.dart';
import '../../../core/domain/profile/model/profile_data_model.dart';
import '../../../pollen_meter_colors.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 24, top: 32, bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: Icon(Icons.arrow_back,
                                color: Theme.of(context).colorScheme.outline),
                          ),
                          const SizedBox(width: 10),
                          Text(context.loc.profilePage,
                              style: Theme.of(context)
                                  .extension<PollenMeterColors>()
                                  ?.titleMedium),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16),
                      child: PollenSelectionWidget(
                        listPollens: Allergen.values
                            .map(
                              (allergen) => PollenTileModel(
                                  selected: ref
                                      .watch(profileLogicProvider)
                                      .allergens
                                      .contains(allergen),
                                  pathImage: null,
                                  allergen: allergen),
                            )
                            .toList(),
                        onChoiceOfTile: (pollenTileModel) {
                          ref
                              .read(profileLogicProvider.notifier)
                              .toggleAllergen(pollenTileModel
                                  .allergen); //.allergens.firstWhere((element) => element == pollenTileModel.allergen)
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16),
                      child: ThemeSelectionWidget(
                        onChoiceOfTile: (ThemeTypes themeTypes) {
                          ref
                              .watch(profileLogicProvider.notifier)
                              .setTheme(themeTypes);
                        },
                        themeType: [ref.watch(profileLogicProvider).theme],
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
