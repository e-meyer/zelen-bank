import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

AppBar appBarMetod() {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
    title: const Text(
      'Extrato',
      style: TextStyle(
        color: kPlainBlack,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    centerTitle: true,
    elevation: 0.0,
  );
}
