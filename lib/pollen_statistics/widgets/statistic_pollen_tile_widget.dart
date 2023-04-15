import 'package:flutter/material.dart';

class StatisticPollenTileWidget extends StatelessWidget {
  StatisticPollenTileWidget({
    Key? key,
    required this.pathImage,
    required this.title,
    required this.levelOfConcentration,
  }) : super(key: key);

  final String pathImage;
  final String title;
  final String levelOfConcentration;

  final Map<String, Color> _mapColor = {
    'Low': Colors.green.shade200,
    'Moderate': Colors.orange.shade200,
    'High': Colors.red.shade200,
    'Very High': Colors.purple.shade300,
  };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: _mapColor[levelOfConcentration],
      leading: Image.asset(pathImage),
      title: Text(title),
      subtitle: Text(
        levelOfConcentration,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
