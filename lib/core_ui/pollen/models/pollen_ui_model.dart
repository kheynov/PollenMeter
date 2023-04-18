import 'package:flutter/material.dart';

import '../../../core/domain/profile/enums/allergen_type.dart';

class PollenUIModel {
  final double value;
  final IconData icon;
  final Color color;
  final String title;
  final String? bottomTitle;
  final AllergenType? allergenType;

  PollenUIModel({
    required this.value,
    required this.title,
    required this.icon,
    required this.color,
    this.allergenType,
    this.bottomTitle,
  });
  @override
  String toString() =>
      'GaugeModel{value: $value, icon: $icon, color: $color, title: $title}';
}
