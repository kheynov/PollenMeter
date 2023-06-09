import 'package:flutter/material.dart';
import '../../pollen_meter_colors.dart';
import '../domain/profile/enums/risk_level.dart';

extension ColorBuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color fromRiskLevel(RiskLevel riskLevel) {
    switch (riskLevel) {
      case RiskLevel.low:
        return theme.extension<PollenMeterColors>()!.lowRisk ??
            Colors.lightGreen;
      case RiskLevel.moderate:
        return theme.extension<PollenMeterColors>()!.moderateRisk ??
            Colors.orange;
      case RiskLevel.high:
        return theme.extension<PollenMeterColors>()!.highRisk ?? Colors.red;
      case RiskLevel.veryHigh:
        return theme.extension<PollenMeterColors>()!.veryHighRisk ??
            Colors.purple;
    }
  }

  List<Color> gradientFromRiskLevel(RiskLevel riskLevel) {
    switch (riskLevel) {
      case RiskLevel.low:
        return [
          theme.extension<PollenMeterColors>()!.lowRisk ?? Colors.lightGreen,
          theme.colorScheme.primary
        ];
      case RiskLevel.moderate:
        return [
          theme.extension<PollenMeterColors>()!.moderateRisk ?? Colors.orange,
          theme.extension<PollenMeterColors>()!.highRisk ?? Colors.red
        ];
      case RiskLevel.high:
        return [
          theme.extension<PollenMeterColors>()!.highRisk ?? Colors.red,
          theme.extension<PollenMeterColors>()!.veryHighRisk ?? Colors.purple
        ];
      case RiskLevel.veryHigh:
        return [
          theme.extension<PollenMeterColors>()!.veryHighRisk ?? Colors.purple
        ];
    }
  }
}
