import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      width: double.maxFinite,
      child: Text(
        "Made by Babry GALEDOU with FLUTTER 3.27",
        style: TextStyle(
            fontWeight: FontWeight.w400, color: CustomColor.whiteSecondary),
      ),
    );
  }
}
