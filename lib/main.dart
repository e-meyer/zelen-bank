import 'package:flutter/material.dart';
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

  runApp(const ZelenBankApp());
}

class ZelenBankApp extends StatelessWidget {
  const ZelenBankApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zelen Bank',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.customtheme[Tema.lightTheme],
      // onGenerateRoute: RouteGenerator.generateRoute,
      // initialRoute: AuthService().handleAuthState(),
      home: AuthService().handleAuthState(),
    );
  }
}
