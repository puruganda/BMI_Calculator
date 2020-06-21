import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onPress;

  BottomButton({@required this.onPress, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomButtonHeight,
        color: kBottomButtonColor,
        child: Text(
          text,
          style: kBottomButtonTextStyle,
        ),
      ),
    );
  }
}
