import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:zelenbank/authentication/presentation/controllers/auth_controller.dart';
import 'package:zelenbank/core/injector/injector.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';
import 'package:zelenbank/core/utils/constants/route_constants.dart';

class LocalAuthScreen extends StatefulWidget {
  const LocalAuthScreen({super.key});

  @override
  State<LocalAuthScreen> createState() => _LocalAuthScreenState();
}

class _LocalAuthScreenState extends State<LocalAuthScreen> {
  final AuthController authController = serviceLocator.get<AuthController>();
  LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await _checkBiometrics();
        await _getAvailableBiometrics();
      },
    );
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<bool> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
      });
      return false;
    }
    if (!mounted) {
      return false;
    }

    return authenticated;
  }

  Future<bool> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Scan to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
      });
      return authenticated;
    }
    if (!mounted) {
      return authenticated;
    }

    return authenticated;
  }

  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: kAquaGreen,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/logo.png',
                color: kPlainWhite,
                height: 60,
              ),
            ),
            InkWell(
              onTap: () async {
                if (_availableBiometrics != null) {
                  final isUserAuthenticated =
                      await _authenticateWithBiometrics();
                  if (isUserAuthenticated) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      kStatementScreen,
                      (route) => false,
                    );
                  }
                } else {
                  final isUserAuthenticated = await _authenticate();
                  if (isUserAuthenticated) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      kStatementScreen,
                      (route) => false,
                    );
                  }
                }
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kPlainWhite,
                    ),
                    child: Center(
                      child: Text(
                        'Usar a senha do celular',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: kPlainBlack,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
