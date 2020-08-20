import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ShadowScreen extends StatelessWidget {
  double xOffset = 290;
  double yOffset = 190;
  double scaleFactor = 0.6;
  @override
  Widget build(BuildContext context) {
     return AnimatedContainer(
     transform: Matrix4.translationValues(xOffset, yOffset, 0)
     ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(40),
          color: Hexcolor("#707070")
        ),
    );
  }
}