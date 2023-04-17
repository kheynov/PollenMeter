import 'package:flutter/material.dart';

class StatisticPollenTileModel {
  final double levelOfConcentration;
  final IconData icon;
  final String title;
  final Color color;

  StatisticPollenTileModel(
      {required this.levelOfConcentration,
      required this.title,
      required this.icon,
      required this.color});
  @override
  String toString() =>
      'StatisticPollenTileModel{levelOfConcentration: $levelOfConcentration, icon: $icon, title: $title}';
}
