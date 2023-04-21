import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/profile/domain/model/pollen_tile_model.dart';

class PollenSelectionWidget extends StatefulWidget {
  const PollenSelectionWidget({
    Key? key,
    this.spacing = 20,
    required this.listPollens,
    required this.onChoiceOfTile,
    this.crossAxisCount = 3,
  }) : super(key: key);

  /// Кол-во элементов в строке
  final int crossAxisCount;

  /// Расстояние между элементами
  final double spacing;

  /// Список моделек
  final List<PollenTileModel> listPollens;

  /// Функция, реагирующая на изменение состояния элементов
  final Function(PollenTileModel pollenModel) onChoiceOfTile;

  @override
  State<PollenSelectionWidget> createState() => _PollenSelectionWidgetState();
}

class _PollenSelectionWidgetState extends State<PollenSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    GroupButtonController tabController = GroupButtonController(
      selectedIndexes: List.generate(widget.listPollens.length,
              (i) => ((widget.listPollens[i].selected ? i : null)))
          .whereType<int>()
          .toList(),
    );
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.allergyMessage,
              style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 20),
          GroupButton(
            isRadio: false,
            enableDeselect: true,
            controller: tabController,
            onSelected: (dynamic, int index, bool selected) {
              widget.listPollens[index].selected = selected;
              widget.onChoiceOfTile.call(widget.listPollens[index]);
              setState(() {});
            },
            options: GroupButtonOptions(
              mainGroupAlignment: MainGroupAlignment.spaceBetween,
              borderRadius: BorderRadius.circular(15),
              selectedShadow: [],
              unselectedShadow: [],
              unselectedColor: Theme.of(context).colorScheme.background,
              selectedTextStyle: Theme.of(context).textTheme.labelSmall,
              unselectedTextStyle: Theme.of(context).textTheme.titleSmall,
            ),
            buttons: widget.listPollens
                .map((e) => context.fromAllergen(e.allergen))
                .toList(),
          ),
        ],
      ),

      // child: GridView.builder(
      //   physics: const NeverScrollableScrollPhysics(),
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     childAspectRatio: 1,
      //     crossAxisSpacing: widget.spacing,
      //     mainAxisSpacing: widget.spacing,
      //     crossAxisCount: widget.crossAxisCount,
      //   ),
      //   itemCount: widget.listPollens.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return SquareTileWidget(
      //       text: widget.listPollens[index].allergen.name,
      //       image: widget.listPollens[index].pathImage != null
      //           ? Image.asset(widget.listPollens[index].pathImage!)
      //           : const Icon(
      //               Icons.local_florist,
      //               size: 40,
      //             ),
      //       selected: widget.listPollens[index].selected,
      //       onTap: (bool selected) {
      //         log(widget.listPollens[index].toString(),
      //             name:
      //                 'SquareTileWidget - ${widget.listPollens[index].allergen.name}');
      //         widget.listPollens[index].selected = selected;
      //         widget.onChoiceOfTile.call(widget.listPollens[index]);
      //         setState(() {});
      //       },
      //     );
      //   },
      // ),
    );
  }
}
