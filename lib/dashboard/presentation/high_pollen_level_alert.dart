import 'package:flutter/material.dart';

import '../../pollen_meter_colors.dart';

class HighPollenLevelAlert extends StatelessWidget {
  final String msg;
  final String emoticon;

  const HighPollenLevelAlert(
      {super.key, required this.msg, required this.emoticon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emoticon,
                style: Theme.of(context)
                    .extension<PollenMeterColors>()
                    ?.titleSmall),
            const SizedBox(height: 10),
            Text(
              msg,
              style:
                  Theme.of(context).extension<PollenMeterColors>()?.bodyLarge,
              textAlign: TextAlign.left,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
