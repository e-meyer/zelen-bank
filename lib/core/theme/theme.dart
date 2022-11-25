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
      primarySwatch: white,
      textTheme: const TextTheme(
        headline1: TextStyle(color: kPlainBlack),
        headline2: TextStyle(color: kPlainBlack),
        bodyText2: TextStyle(color: kPlainBlack),
        subtitle1: TextStyle(color: kPlainBlack),
      ),
    ),
  };
}
