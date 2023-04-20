import 'package:flutter/material.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/profile/domain/model/pollen_tile_model.dart';

class EmotionPickerWidget extends StatefulWidget {
  const EmotionPickerWidget({
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
  State<EmotionPickerWidget> createState() => _EmotionPickerWidgetState();
}

class _EmotionPickerWidgetState extends State<EmotionPickerWidget> {
  // double _curPosition = 3;
  @override
  Widget build(BuildContext context) {
    // GroupButtonController tabController = GroupButtonController(
    //   selectedIndexes: List.generate(widget.listPollens.length,
    //           (i) => ((widget.listPollens[i].selected ? i : null)))
    //       .whereType<int>()
    //       .toList(),
    // );
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.feels,
              style: Theme.of(context).textTheme.displayMedium),
        ],
      ),
    );
  }
}
