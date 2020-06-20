import 'package:bmicalculator/components/bottom_button.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiResultText;
  final String bmiRange;
  final String bmiRangeText;
  final String interpretation;

  ResultPage(
      {@required this.bmiResult,
      @required this.bmiResultText,
      @required this.bmiRange,
      @required this.bmiRangeText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Your Result',
                  style: kResultHeadingTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardChild: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      bmiResultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: bmiRangeText, style: kLabelTextStyle),
                          TextSpan(
                            text: bmiRange,
                            style: kBMI_DescriptionTextStyle,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      interpretation,
                      style: kBMI_DescriptionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE YOUR BMI',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
