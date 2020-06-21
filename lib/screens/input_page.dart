import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/components/icon_content.dart';
import 'package:bmicalculator/components/weight_and_age_selector.dart';
import 'package:bmicalculator/components/bottom_button.dart';
import 'package:bmicalculator/calculator_brain.dart';
import 'result_page.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

GenderType selectedGender;

int height = 180;
int age = 25;
int weight = 60;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                      colour: selectedGender == GenderType.male
                          ? kActiveColor
                          : kInactiveColor,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                      colour: selectedGender == GenderType.female
                          ? kActiveColor
                          : kInactiveColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: Color(0xFFEA1556),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8E8E99),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x1FEA1556),
                      trackHeight: 3.5,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: WeightAndAgeSelector(
                      content: weight,
                      contentType: 'WEIGHT',
                      onTapMinus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      onTapPlus: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: WeightAndAgeSelector(
                      content: age,
                      contentType: 'AGE',
                      onTapMinus: () {
                        setState(() {
                          age--;
                        });
                      },
                      onTapPlus: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE YOUR BMI',
            onPress: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );
              calc.calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.getBMI(),
                    bmiResultText: calc.getResult(),
                    bmiRangeText: calc.getBMIRangeText(),
                    bmiRange: calc.getBMIRange(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
