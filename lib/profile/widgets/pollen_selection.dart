import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pollen_meter/profile/model/pollen_tile_model.dart';
import 'package:pollen_meter/profile/widgets/square_tile.dart';

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
  final List<PollenModel> listPollens;

  /// Функция, реагирующая на изменение состояния элементов
  final Function(PollenModel pollenModel) onChoiceOfTile;

  @override
  State<PollenSelectionWidget> createState() => _PollenSelectionWidgetState();
}

class _PollenSelectionWidgetState extends State<PollenSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisSpacing: widget.spacing,
            mainAxisSpacing: widget.spacing,
            crossAxisCount: widget.crossAxisCount,
          ),
          itemCount: widget.listPollens.length,
          itemBuilder: (BuildContext context, int index) {
            return SquareTileWidget(
              text: widget.listPollens[index].name,
              image: widget.listPollens[index].pathImage != null
                  ? Image.asset(widget.listPollens[index].pathImage!)
                  : const Icon(
                      Icons.local_florist,
                      size: 40,
                    ),
              selected: widget.listPollens[index].selected,
              onTap: (bool selected) {
                log(widget.listPollens[index].toString(),
                    name:
                        'SquareTileWidget - ${widget.listPollens[index].name}');
                widget.listPollens[index].selected = selected;
                widget.onChoiceOfTile.call(widget.listPollens[index]);
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }
}
