import 'package:flutter/material.dart';
import 'package:zelenbank/core/firebase/auth/auth_service.dart';
import 'package:zelenbank/core/utils/constants/route_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Center(
            child: ElevatedButton(
          onPressed: () async {
            final result = await _authService.signInWithGoogle();
            if (result) {
              Navigator.pushNamed(context, kStatementScreen);
            }
          },
          child: Text('Login com google'),
        )),
      ),
    );
  }
}
