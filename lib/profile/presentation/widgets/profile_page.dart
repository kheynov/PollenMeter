import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pollen_meter/profile/presentation/widgets/pollen_selection.dart';
import 'package:pollen_meter/profile/domain/model/pollen_tile_model.dart';
import '../../../core/domain/profile/enums/allergen.dart';
import '../../../core/utils/logger.dart';
import 'dart:math';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
                  const Text("Профиль")
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("На что у вас аллергия?"),
            const SizedBox(
              height: 20,
            ),
            PollenSelectionWidget(
              listPollens: Allergen.values
                  .map((allergen) => PollenTileModel(
                      name: allergen.name,
                      selected: Random().nextBool(),
                      pathImage: 'assets/images/pollen/default.svg'))
                  .toList(),
              onChoiceOfTile: (pollenTileModel) {
                Logger.log(pollenTileModel.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
