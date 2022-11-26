import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';

AppBar appBarMethod({Widget? leading, String? titulo}) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
    leading: leading,
    title: Text(
      titulo!,
      style: const TextStyle(
        color: kPlainBlack,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    centerTitle: true,
    elevation: 0.0,
  );
}
