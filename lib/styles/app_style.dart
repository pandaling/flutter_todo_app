import 'package:flutter/material.dart';
import 'package:flutter_todo_app/styles/palette.dart';

class AppStyle {
  static const double leftPadding = 16.0;
  static const double boxBorderRadius = 8.0;

  static const FontWeight fontWeightT1 = FontWeight.w900;
  static const FontWeight fontWeightT2 = FontWeight.w600;
  static const FontWeight fontWeightT3 = FontWeight.w400;
  static const FontWeight fontWeightT4 = FontWeight.w200;
  static const FontWeight fontWeight500 = FontWeight.w500;
  static const FontWeight fontWeight700 = FontWeight.w700;
  static const FontWeight fontWeightBold = FontWeight.bold;

  static const TextStyle text24W700Black = TextStyle(
    fontSize: 24.0,
    fontWeight: fontWeight700,
    color: Colors.black,
  );

  // ====== new ======
  static const TextStyle text11BoldT2 = TextStyle(
    fontSize: 11.0,
    fontWeight: fontWeightT3,
    color: Palette.t2,
  );

  static const TextStyle text14BoldT1 = TextStyle(
    fontSize: 14.0,
    fontWeight: fontWeightBold,
    color: Palette.t1,
  );

  static const TextStyle text11BoldT1 = TextStyle(
    fontSize: 11.0,
    fontWeight: fontWeightBold,
    color: Palette.t1,
  );
}
