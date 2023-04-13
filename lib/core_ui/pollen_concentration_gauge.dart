import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:flutter/material.dart';

class PollenConcentrationGauge extends StatelessWidget {
  const PollenConcentrationGauge(
      {super.key,
      required this.concentration,
      required this.icon,
      required this.gaugeColor,
      required this.progressBarColor,
      required this.thickness,
      required this.min,
      required this.max,
      required this.textColor,
      required this.fontSize,
      required this.text});

  final double concentration;
  final IconData icon;
  final Color gaugeColor;
  final Color progressBarColor;
  final double thickness;
  final double min;
  final double max;
  final Color textColor;
  final double fontSize;
  final String text;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          RadialGauge(
            radius: (constraints.maxWidth < constraints.maxHeight
                    ? constraints.maxWidth
                    : constraints.maxHeight) /
                2,
            value: concentration,
            progressBar: GaugeRoundedProgressBar(color: progressBarColor),
            axis: GaugeAxis(
              min: min,
              max: max,
              degrees: 270,
              style: GaugeAxisStyle(
                thickness: thickness,
                background: gaugeColor,
              ),
            ),
            child: FittedBox(fit: BoxFit.fill, child: Icon(icon)),
          ),
          FittedBox(
              fit: BoxFit.cover,
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                ),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
