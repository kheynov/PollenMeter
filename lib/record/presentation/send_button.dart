import 'package:flutter/material.dart';

import '../../pollen_meter_colors.dart';

class SendButtonWidget extends StatelessWidget {
  const SendButtonWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  /// Функция, реагирующая на изменение состояния элементов
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          Text(text,
              style: Theme.of(context)
                  .extension<PollenMeterColors>()
                  ?.primaryDisplayLarge),
        ],
      ),
    );
  }
}
