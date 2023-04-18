import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';
import 'package:pollen_meter/core_ui/pollen/models/pollen_ui_model.dart';

class Gauge extends StatelessWidget {
  const Gauge({
    super.key,
    required this.data,
  });

  final PollenUIModel data;

  @override
  Widget build(BuildContext context) {
    double textShare = 0.1;
    late double largerOfTextsShare;
    if (data.bottomTitle?.isNotEmpty ?? false) {
      largerOfTextsShare = 7.0 / 12;
    } else {
      largerOfTextsShare = 1;
    }
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          RadialGauge(
            radius: constraints.biggest.shortestSide * (1 - textShare) / 2,
            value: data.value,
            progressBar: GaugeRoundedProgressBar(color: data.color),
            axis: GaugeAxis(
              min: 0,
              max:
                  context.reasonableTypeLimit(allergenType: data.allergenType!),
              degrees: 270,
              style: GaugeAxisStyle(
                thickness: (constraints.biggest.shortestSide / 20),
                background: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: FittedBox(fit: BoxFit.contain, child: Icon(data.icon)),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge?.color,
                    fontSize: constraints.biggest.shortestSide *
                        textShare *
                        largerOfTextsShare,
                    fontFamily:
                        Theme.of(context).textTheme.labelLarge?.fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                data.bottomTitle != null
                    ? Text(
                        data.bottomTitle!,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.labelLarge?.color,
                          fontSize: constraints.biggest.shortestSide *
                              textShare *
                              (1 - largerOfTextsShare),
                          fontFamily: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.fontFamily,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
