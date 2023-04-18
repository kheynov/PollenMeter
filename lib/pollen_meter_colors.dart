import 'package:flutter/material.dart';

@immutable
class PollenMeterColors extends ThemeExtension<PollenMeterColors> {
  const PollenMeterColors(
      {required this.lowRisk,
      required this.moderateRisk,
      required this.highRisk,
      required this.veryHighRisk});
  final Color? lowRisk;
  final Color? moderateRisk;
  final Color? highRisk;
  final Color? veryHighRisk;
  @override
  ThemeExtension<PollenMeterColors> copyWith(
          {Color? lowRisk,
          Color? moderateRisk,
          Color? highRisk,
          Color? veryHighRisk}) =>
      PollenMeterColors(
          lowRisk: lowRisk ?? this.lowRisk,
          moderateRisk: moderateRisk ?? this.moderateRisk,
          highRisk: highRisk ?? this.highRisk,
          veryHighRisk: veryHighRisk ?? this.veryHighRisk);

  @override
  ThemeExtension<PollenMeterColors> lerp(
      covariant PollenMeterColors? other, double t) {
    if (other is! PollenMeterColors) return this;
    return PollenMeterColors(
      lowRisk: Color.lerp(lowRisk, other.lowRisk, t),
      moderateRisk: Color.lerp(moderateRisk, other.moderateRisk, t),
      highRisk: Color.lerp(highRisk, other.highRisk, t),
      veryHighRisk: Color.lerp(veryHighRisk, other.veryHighRisk, t),
    );
  }
}
