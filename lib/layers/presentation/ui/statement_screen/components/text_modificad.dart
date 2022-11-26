import 'package:flutter/material.dart';

Text textModificad(
    {required String texto, double? size, FontWeight? bold, double? height}) {
  return Text(
    texto,
    style: TextStyle(
      height: height,
      fontSize: size,
      fontWeight: bold,
    ),
  );
}
