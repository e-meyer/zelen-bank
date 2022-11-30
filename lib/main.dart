import 'package:flutter/material.dart';
import 'package:zelenbank/core/utils/route_generator.dart';
import 'core/injector/injector.dart';
import 'core/theme/theme.dart';
import 'core/utils/constants/route_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: kStatementScreen,
    );
  }
}
