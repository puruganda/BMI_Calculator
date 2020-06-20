import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:bmicalculator/components/bmi_content.dart';

enum BodyType { underweight, normal, overweight, obese }

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;
  BodyType _selectedType;

  CalculatorBrain({@required this.weight, @required this.height});

  Map<BodyType, BMIContent> _bmiContent = {
    BodyType.underweight: BMIContent(
        resultText: 'UnderWeight',
        resultRangeText: 'UnderWeight BMI Range: \n',
        resultRange: '< 18.5 kg/m2',
        resultInterpretation:
            'You have lower than normal body weight.\n You can eat a bit more.'),
    BodyType.normal: BMIContent(
        resultText: 'Normal',
        resultRangeText: 'Normal BMI Range: \n',
        resultRange: '18.5 - 24.9 kg/m2',
        resultInterpretation: 'You have a normal body weight.\n Good job!'),
    BodyType.overweight: BMIContent(
        resultText: 'OverWeight',
        resultRangeText: 'OverWeight BMI Range: \n',
        resultRange: '25 - 29.9 kg/m2',
        resultInterpretation:
            'You have higher than normal body weight. Try to exercise more.'),
    BodyType.obese: BMIContent(
        resultText: 'Obese',
        resultRangeText: 'Obese BMI Range: \n',
        resultRange: '>= 30 kg/m2',
        resultInterpretation:
            'You have a very high body weight.\n Try to reduce meals and exercise more.'),
  };

  void calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    if (_bmi >= 30) {
      _selectedType = BodyType.obese;
    } else if (_bmi >= 25) {
      _selectedType = BodyType.overweight;
    } else if (_bmi >= 18.5) {
      _selectedType = BodyType.normal;
    } else {
      _selectedType = BodyType.underweight;
    }
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    return _bmiContent[_selectedType].resultText;
  }

  String getInterpretation() {
    return _bmiContent[_selectedType].resultInterpretation;
  }

  String getBMIRange() {
    return _bmiContent[_selectedType].resultRange;
  }

  String getBMIRangeText() {
    return _bmiContent[_selectedType].resultRangeText;
  }
}
