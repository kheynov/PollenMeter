import 'package:flutter/material.dart';
import 'package:pollen_meter/core/utils/colors.dart';
import 'package:pollen_meter/core_ui/models/statistic_pollen_tile/statistic_pollen_tile_model.dart';

class StatisticPollenTileWidget extends StatelessWidget {
  const StatisticPollenTileWidget({
    Key? key,
    required this.statisticModel,
  }) : super(key: key);

  final StatisticPollenTileModel statisticModel;
  // final Map<String, Color> _mapColor = {
  //   'Low': Colors.green.shade200,
  //   'Moderate': Colors.orange.shade200,
  //   'High': Colors.red.shade200,
  //   'Very High': Colors.purple.shade300,
  // };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: getColorForLevel(statisticModel.levelOfConcentration),
      leading: Icon(statisticModel
          .icon), //Image.asset(pathImage),  //replace with Image.asset when we add assets, uses default IconData for now
      title: Text(statisticModel.title),
      subtitle: Text(
        statisticModel.levelOfConcentration.toStringAsFixed(2),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
