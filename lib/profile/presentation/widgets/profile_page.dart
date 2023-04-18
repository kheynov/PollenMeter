import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pollen_meter/main.dart';
import 'package:pollen_meter/profile/presentation/widgets/pollen_selection.dart';
import 'package:pollen_meter/profile/domain/model/pollen_tile_model.dart';
import '../../../core/domain/profile/enums/allergen.dart';

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
            SizedBox(
              //wtf
              height: 1500,
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
                  ref.read(profileLogicProvider.notifier).toggleAllergen(
                      pollenTileModel
                          .allergen); //.allergens.firstWhere((element) => element == pollenTileModel.allergen)
                },
              ),
            ),
            Row(
              children: [
                const Text("Местоположение"),
                MaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  color: Colors.green,
                  child: const Icon(Icons.edit),
                ),
              ],
            ),
            const Text("Текущее"),
            MaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              color: Colors.green,
              child: const Icon(Icons.edit),
            ),
            const Text("Сменить тему"),
          ],
        ),
      ),
    );
  }
}
