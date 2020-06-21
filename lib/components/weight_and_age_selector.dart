import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'round_icon_content.dart';

class WeightAndAgeSelector extends StatelessWidget {
  final int content;
  final String contentType;
  final Function onTapPlus;
  final Function onTapMinus;

  WeightAndAgeSelector(
      {@required this.content,
      @required this.contentType,
      @required this.onTapPlus,
      @required this.onTapMinus});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          contentType,
          style: kLabelTextStyle,
        ),
        Text(
          content.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onTap: onTapMinus,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onTap: onTapPlus,
            ),
          ],
        ),
      ],
    );
  }
}
