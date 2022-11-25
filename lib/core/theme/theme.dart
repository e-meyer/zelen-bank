import 'package:flutter/material.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

enum Tema {
  lightTema,
}

class CustomTheme {
  static final customtheme = {
    Tema.lightTema: ThemeData(
      brightness: Brightness.light,
      primaryColor: kAquaGreen,
      backgroundColor: kLightGrey,
      scaffoldBackgroundColor: kPlainWhite,
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
