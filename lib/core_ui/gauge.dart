import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pollen_meter/core/extensions/localized_build_context.dart';

import 'gauge/models/gauge_model.dart';

class Gauge extends StatelessWidget {
  const Gauge({
    super.key,
    required this.data,
  });

  final GaugeModel data;

  //TODO: replace hardcoded constants with theme data and/or calculate in runtime
  //TODO: find out what the max concentration from the API is
  //(The gauge would just clip if the value exceeds the max; it is only for information purposes)
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
              max: context.reasonableTypeLimit(allergenType: data.allergenType),
              degrees: 270,
              style: GaugeAxisStyle(
                thickness: (constraints.biggest.shortestSide / 20),
                background: Colors.blue,
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
                    color: Colors.black,
                    fontSize: constraints.biggest.shortestSide *
                        textShare *
                        largerOfTextsShare,
                  ),
                  textAlign: TextAlign.center,
                ),
                data.bottomTitle != null
                    ? Text(
                        data.bottomTitle!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: constraints.biggest.shortestSide *
                              textShare *
                              (1 - largerOfTextsShare),
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
