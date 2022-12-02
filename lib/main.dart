import 'package:flutter/material.dart';
import 'package:zelenbank/core/utils/route_generator.dart';
import 'core/injector/injector.dart';
import 'core/theme/theme.dart';
import 'core/utils/constants/route_constants.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

ValueNotifier<ThemeMode> tema = ValueNotifier(ThemeMode.system);

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
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: tema,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ZelenBank',
          themeMode: tema.value,
          theme: CustomTheme.customtheme[Tema.lightTheme],
          darkTheme: CustomTheme.customtheme[Tema.darkTheme],
          initialRoute: kStatementScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
