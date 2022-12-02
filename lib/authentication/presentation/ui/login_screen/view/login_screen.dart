import 'package:flutter/material.dart';
import 'package:zelenbank/authentication/presentation/controllers/auth_controller.dart';
import 'package:zelenbank/core/firebase/auth/auth_service.dart';
import 'package:zelenbank/core/injector/injector.dart';
import 'package:zelenbank/core/utils/constants/route_constants.dart';
import 'package:zelenbank/layers/presentation/ui/common/custom_alert_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  final AuthController _authController = serviceLocator.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Center(
            child: ElevatedButton(
          onPressed: () async {
            await _authController.signInWithGoogle();
            print(_authController.loginState);
            if (_authController.loginState == LoginState.success) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                kStatementScreen,
                (route) => false,
              );
            } else if (_authController.loginState == LoginState.error) {
              print('adfdagadadg');
              showAlertDialog(context);
            }
          },
          child: Text('Login com google'),
        )),
      ),
    );
  }
}
