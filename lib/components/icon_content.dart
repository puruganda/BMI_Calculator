import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class IconContent extends StatelessWidget {
  final IconData genderIcon;
  final String gender;
  final Color colour;

  IconContent(
      {@required this.genderIcon,
      @required this.gender,
      @required this.colour});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: kGenderIconSize,
          color: colour,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 20.0,
            color: colour,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
