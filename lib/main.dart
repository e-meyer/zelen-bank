import 'package:flutter/material.dart';
import 'package:zelenbank/authentication/presentation/controllers/auth_controller.dart';
import 'package:zelenbank/core/firebase/auth/auth_service.dart';
import 'package:zelenbank/core/utils/route_generator.dart';
import 'core/injector/injector.dart';
import 'core/theme/theme.dart';
import 'core/utils/constants/route_constants.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupLocator();

  runApp(ZelenBankApp());
}

class ZelenBankApp extends StatefulWidget {
  ZelenBankApp({super.key});

  @override
  State<ZelenBankApp> createState() => _ZelenBankAppState();
}

class _ZelenBankAppState extends State<ZelenBankApp> {
  final AuthController _authController = serviceLocator.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zelen Bank',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.customtheme[Tema.lightTheme],
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute:
          _authController.isUserLoggedIn() ? kStatementScreen : kLoginScreen,
      // home: AuthService().handleAuthState(),
    );
  }
}
