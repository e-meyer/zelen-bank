import 'package:flutter/material.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

enum Tema {
  lightTheme,
}

class CustomTheme {
  static final customtheme = {
    Tema.lightTheme: ThemeData(
      brightness: Brightness.light,
      primaryColor: kAquaGreen,
      backgroundColor: kLightGrey,
      scaffoldBackgroundColor: kPlainWhite,
      primarySwatch: white,
      textTheme: const TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.w500,
            color: kPlainBlack,
            fontSize: 15,
          ),
          headline2: TextStyle(
            letterSpacing: -0.5,
            color: kPlainBlack,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          headline3: TextStyle(
            letterSpacing: -0.5,
            color: kPlainBlack,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          headline4: TextStyle(
            letterSpacing: -0.5,
            color: kAquaGreen,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          caption: TextStyle(
            letterSpacing: -0.5,
            color: kPlainBlack,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          subtitle1: TextStyle(
            color: kSubtitleColor,
            fontSize: 14,
          ),
          subtitle2: TextStyle(
            letterSpacing: -0.5,
            fontSize: 15,
            color: kSubtitleColor,
            fontWeight: FontWeight.w500,
          ),
          button: TextStyle(
            fontSize: 16,
            color: kPlainWhite,
            fontWeight: FontWeight.w500,
          )),
    ),
  };
}
