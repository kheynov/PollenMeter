import 'package:flutter/material.dart';

import '../../core/domain/ambee_api/models/pollen_model.dart';
import '../../core_ui/models/gauge_model.dart';

GaugeModel getMainGaugeState(PollenModel data) {
  Map<String, Color> riskColors = {
    'Low': Colors.green,
    'Moderate': Colors.yellow,
    'High': Colors.red,
    'Very High': Colors.purple,
  };
  List result = [
    GaugeModel(
        value: data.count.treePollen.toDouble(),
        title: data.risk.treePollen,
        icon: Icons.park,
        color: riskColors[data.risk.treePollen] ?? Colors.white60),
    GaugeModel(
        value: data.count.weedPollen.toDouble(),
        title: data.risk.weedPollen,
        icon: Icons.nature,
        color: riskColors[data.risk.weedPollen] ?? Colors.white60),
    GaugeModel(
        value: data.count.grassPollen.toDouble(),
        title: data.risk.grassPollen,
        icon: Icons.grass,
        color: riskColors[data.risk.grassPollen] ?? Colors.white60)
  ];
  result.sort((lhs, rhs) => rhs.value.compareTo(lhs.value));
  return result[0];
}
