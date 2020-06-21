import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  RoundIconButton({@required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: kRoundIconButtonSize,
      elevation: 6.0,
      child: Icon(
        icon,
      ),
      onPressed: onTap,
    );
  }
}
