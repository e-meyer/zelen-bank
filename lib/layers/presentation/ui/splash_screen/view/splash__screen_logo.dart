import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreenLogo extends StatefulWidget {
  const SplashScreenLogo({Key? key}) : super(key: key);

  @override
  State<SplashScreenLogo> createState() => _SplashScreenLogoState();
}

class _SplashScreenLogoState extends State<SplashScreenLogo> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    Future.delayed(const Duration(seconds: 5)).then((_) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ScreenExtract()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/app_icon_desafio.png",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
