import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:flutter/material.dart';

class PollenConcentrationGauge extends StatelessWidget {
  const PollenConcentrationGauge(
      {super.key,
      required this.concentration,
      required this.progressBarColor,
      required this.text});

  final double concentration;
  final Color progressBarColor;
  final String text;

  //TODO: replace hardcoded constants with theme data and/or calculate in runtime
  //TODO: find out what the max concentration from the API is
  //(The gauge would just clip if the value exceeds the max; it is only for information purposes)
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          RadialGauge(
            radius: constraints.biggest.shortestSide * 3 / 7,
            value: concentration,
            progressBar: GaugeRoundedProgressBar(color: progressBarColor),
            axis: GaugeAxis(
              min: 0,
              max: 500,
              degrees: 270,
              style: GaugeAxisStyle(
                thickness: (constraints.biggest.shortestSide / 20),
                background: Colors.blue,
              ),
            ),
            child:
                const FittedBox(fit: BoxFit.contain, child: Icon(Icons.forest)),
          ),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: constraints.biggest.shortestSide / 7,
                ),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
