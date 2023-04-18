import 'package:flutter/material.dart';
import '../domain/profile/enums/risk_level.dart';

Color riskColor(RiskLevel riskLevel) {
  switch (riskLevel) {
    case RiskLevel.low:
      return Colors.green;
    case RiskLevel.moderate:
      return Colors.yellow;
    case RiskLevel.high:
      return Colors.red;
    case RiskLevel.veryHigh:
      return Colors.purple;
  }
}
