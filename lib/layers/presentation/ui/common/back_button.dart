import 'package:flutter/material.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: kPlainBlack,
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.pop(context),
    );
  }
}
