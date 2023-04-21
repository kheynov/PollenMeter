import 'package:flutter/material.dart';

@immutable
class PollenMeterColors extends ThemeExtension<PollenMeterColors> {
  const PollenMeterColors({
    required this.lowRisk,
    required this.moderateRisk,
    required this.highRisk,
    required this.veryHighRisk,
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.primaryDisplayLarge,
    required this.primaryDisplayMedium,
    required this.statsTitle,
  });
  final Color? lowRisk;
  final Color? moderateRisk;
  final Color? highRisk;
  final Color? veryHighRisk;
  final TextStyle? displayLarge;
  final TextStyle? displayMedium;
  final TextStyle? displaySmall;
  final TextStyle? headlineLarge;
  final TextStyle? headlineMedium;
  final TextStyle? headlineSmall;
  final TextStyle? bodyLarge;
  final TextStyle? bodyMedium;
  final TextStyle? bodySmall;
  final TextStyle? titleLarge;
  final TextStyle? titleMedium;
  final TextStyle? titleSmall;
  final TextStyle? labelLarge;
  final TextStyle? labelMedium;
  final TextStyle? labelSmall;
  final TextStyle? primaryDisplayLarge;
  final TextStyle? primaryDisplayMedium;
  final TextStyle? statsTitle;
  @override
  ThemeExtension<PollenMeterColors> copyWith({
    Color? lowRisk,
    Color? moderateRisk,
    Color? highRisk,
    Color? veryHighRisk,
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? primaryDisplayLarge,
    TextStyle? primaryDisplayMedium,
    TextStyle? statsTitle,
  }) =>
      PollenMeterColors(
        lowRisk: lowRisk ?? this.lowRisk,
        moderateRisk: moderateRisk ?? this.moderateRisk,
        highRisk: highRisk ?? this.highRisk,
        veryHighRisk: veryHighRisk ?? this.veryHighRisk,
        displayLarge: displayLarge ?? this.displayLarge,
        displayMedium: displayMedium ?? this.displayMedium,
        displaySmall: displaySmall ?? this.displaySmall,
        headlineLarge: headlineLarge ?? this.headlineLarge,
        headlineMedium: headlineMedium ?? this.headlineMedium,
        headlineSmall: headlineSmall ?? this.headlineSmall,
        bodyLarge: bodyLarge ?? this.bodyLarge,
        bodyMedium: bodyMedium ?? this.bodyMedium,
        bodySmall: bodySmall ?? this.bodySmall,
        titleLarge: titleLarge ?? this.titleLarge,
        titleMedium: titleMedium ?? this.titleMedium,
        titleSmall: titleSmall ?? this.titleSmall,
        labelLarge: labelLarge ?? this.labelLarge,
        labelMedium: labelMedium ?? this.labelMedium,
        labelSmall: labelSmall ?? this.labelSmall,
        primaryDisplayLarge: primaryDisplayLarge ?? this.primaryDisplayLarge,
        primaryDisplayMedium: primaryDisplayMedium ?? this.primaryDisplayMedium,
        statsTitle: statsTitle ?? this.statsTitle,
      );

  @override
  ThemeExtension<PollenMeterColors> lerp(
      covariant PollenMeterColors? other, double t) {
    if (other is! PollenMeterColors) return this;
    return PollenMeterColors(
      lowRisk: Color.lerp(lowRisk, other.lowRisk, t),
      moderateRisk: Color.lerp(moderateRisk, other.moderateRisk, t),
      highRisk: Color.lerp(highRisk, other.highRisk, t),
      veryHighRisk: Color.lerp(veryHighRisk, other.veryHighRisk, t),
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t),
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t),
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t),
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t),
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t),
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t),
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t),
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t),
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t),
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t),
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t),
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t),
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t),
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t),
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t),
      primaryDisplayLarge:
          TextStyle.lerp(primaryDisplayLarge, other.primaryDisplayLarge, t),
      primaryDisplayMedium:
          TextStyle.lerp(primaryDisplayMedium, other.primaryDisplayMedium, t),
      statsTitle: TextStyle.lerp(statsTitle, other.statsTitle, t),
    );
  }
}
