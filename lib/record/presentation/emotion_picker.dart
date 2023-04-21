import 'package:flutter/material.dart';
import 'package:pollen_meter/core/domain/diary/enums/well_being_state.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';

import '../../pollen_meter_colors.dart';

class EmotionPickerWidget extends StatefulWidget {
  const EmotionPickerWidget({
    Key? key,
    required this.onChoice,
  }) : super(key: key);

  /// Функция, реагирующая на изменение состояния элементов
  final Function(WellBeingState wellBeingState) onChoice;

  @override
  State<EmotionPickerWidget> createState() => _EmotionPickerWidgetState();
}

class _EmotionPickerWidgetState extends State<EmotionPickerWidget> {
  double _curPosition = 3;
  @override
  Widget build(BuildContext context) {
    Map<int, WellBeingState> toWellBeingState = {
      0: WellBeingState.dead,
      1: WellBeingState.bad,
      2: WellBeingState.sad,
      3: WellBeingState.ok,
      4: WellBeingState.good,
      5: WellBeingState.veryGood,
    };
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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: WellBeingState.values
                .map((e) => Text(e.emoji,
                    style: Theme.of(context).textTheme.titleSmall))
                .toList(),
          ),
          Slider(
            value: _curPosition,
            min: 0,
            max: 5,
            divisions: 5,
            onChanged: (value) {
              widget.onChoice.call(toWellBeingState[value]!);
              setState(() {
                _curPosition = value;
              });
            },
            activeColor:
                Theme.of(context).extension<PollenMeterColors>()?.highRisk!,
            inactiveColor: Theme.of(context).colorScheme.background,
          ),
        ],
      ),
    );
  }
}
