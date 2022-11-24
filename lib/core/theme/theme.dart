import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

class CustomTheme {
  static ThemeData? getTheme() {
    return ThemeData(
      primaryColor: kAquaGreen,
      backgroundColor: kLightGrey,
      textTheme: const TextTheme(
        headline1: TextStyle(color: kPlainBlack),
        headline2: TextStyle(color: kPlainBlack),
        bodyText2: TextStyle(color: kPlainBlack),
        subtitle1: TextStyle(color: kPlainBlack),
      ),
    );
  }
}
