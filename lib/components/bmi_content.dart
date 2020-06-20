import 'package:flutter/cupertino.dart';

class BMIContent {
  final String resultText;
  final String resultRange;
  final String resultRangeText;
  final String resultInterpretation;

  BMIContent(
      {@required this.resultText,
      @required this.resultRange,
      @required this.resultRangeText,
      @required this.resultInterpretation});
}
