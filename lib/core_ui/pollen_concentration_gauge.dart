import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:flutter/material.dart';

import 'models/gauge_model.dart';

class PollenConcentrationGauge extends StatelessWidget {
  const PollenConcentrationGauge({
    super.key,
    required this.data,
  });

  final GaugeModel data;

  //TODO: replace hardcoded constants with theme data and/or calculate in runtime
  //TODO: find out what the max concentration from the API is
  //(The gauge would just clip if the value exceeds the max; it is only for information purposes)
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          RadialGauge(
            radius: constraints.biggest.shortestSide * 9 / 20,
            value: data.value,
            progressBar: GaugeRoundedProgressBar(color: data.color),
            axis: GaugeAxis(
              min: 0,
              max: 500,
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
              child: Text(
                data.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: constraints.biggest.shortestSide / 10,
                ),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
