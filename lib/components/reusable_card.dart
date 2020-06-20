import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  final Function onPress;
  ReusableCard({this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
