import 'package:box_keeper_app/app/res/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();
  static TextStyle customText({
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    double fontSize = 12,
    double? height,
    String? fontfamily,
  }) {
    return TextStyle(
      fontFamily: fontfamily ?? AppFonts.patuaOne,
      color: color ?? Colors.black,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle headingStyle22() {
    return TextStyle(
      fontFamily: AppFonts.lukiestGuy,
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
  }
}
