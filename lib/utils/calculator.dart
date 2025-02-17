import 'dart:math';

import 'package:bmi_do/values/strings.dart';

class Calculator {
  final double _bmi;

  Calculator({
    required int weight,
    required int height,
  }) : _bmi = weight / pow(height / 100, 2);

  int getWholePart() => _bmi.floor();

  int getFractionPart() => ((_bmi - getWholePart()) * 100).round();

  String getResultText() {
    if (_bmi >= 25) {
      return kOverWeightText;
    } else if (_bmi >= 18.5) {
      return kNormalText;
    } else {
      return kUnderWeightText;
    }
  }

  String getResultDescription() {
    if (_bmi >= 25) {
      return kOverWeightDescription;
    } else if (_bmi >= 18.5) {
      return kNormalDescription;
    } else {
      return kUnderWeightDescription;
    }
  }
}
