import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  const Authentication({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Autenticação',
      style: TextStyle(
        height: 3.5,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
