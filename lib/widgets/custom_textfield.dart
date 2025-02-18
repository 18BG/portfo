import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final int maxLine;

  const CustomTextfield(
      {super.key, this.hintText, this.controller, this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
    return TextField(
      controller: controller,
      maxLines: maxLine,
      style: TextStyle(
        color: CustomColor.scaffoldBg,
      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: CustomColor.hintDark,
          ),
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: CustomColor.whiteSecondary,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder),
    );
  }
}
