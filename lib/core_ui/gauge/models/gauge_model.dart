import 'package:flutter/material.dart';

import '../../../core/domain/profile/enums/allergen_type.dart';

class GaugeModel {
  final double value;
  final IconData icon;
  final Color color;
  final String title;
  final String? bottomTitle;
  final AllergenType allergenType;

  GaugeModel({
    required this.value,
    required this.title,
    required this.icon,
    required this.color,
    required this.allergenType,
    this.bottomTitle,
  });
  @override
  String toString() =>
      'GaugeModel{value: $value, icon: $icon, color: $color, title: $title}';
}
