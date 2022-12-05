import 'package:flutter/material.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

class LoginTextBox extends StatelessWidget {
  const LoginTextBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Uma nova maneira de \n',
        style: TextStyle(
          color: kPlainBlack,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        children: [
          TextSpan(
            text: 'gerenciar dinheiro',
            style: TextStyle(
              color: kAquaGreen,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
