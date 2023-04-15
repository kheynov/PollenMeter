import 'package:flutter/material.dart';

class GaugeModel {
  final double value;
  final IconData icon;
  final Color color;
  final String title;
  final String? bottomTitle;

  GaugeModel({
    required this.value,
    required this.title,
    required this.icon,
    required this.color,
    this.bottomTitle,
  });
  @override
  String toString() =>
      'GaugeModel{value: $value, icon: $icon, color: $color, title: $title}';
}
