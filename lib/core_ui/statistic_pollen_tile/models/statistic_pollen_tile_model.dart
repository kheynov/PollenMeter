import 'package:flutter/material.dart';

class StatisticPollenTileModel {
  final double levelOfConcentration;
  final IconData icon;
  final String title;

  StatisticPollenTileModel({
    required this.levelOfConcentration,
    required this.title,
    required this.icon,
  });
  @override
  String toString() =>
      'StatisticPollenTileModel{levelOfConcentration: $levelOfConcentration, icon: $icon, title: $title}';
}
