import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar appBarMetod() {
  return AppBar(
    systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    title: const Text('Extrato'),
    centerTitle: true,
    elevation: 0.0,
  );
}
