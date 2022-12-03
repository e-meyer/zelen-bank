import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zelenbank/authentication/presentation/controllers/auth_controller.dart';
import 'package:zelenbank/core/firebase/auth/auth_service.dart';
import 'package:zelenbank/core/injector/injector.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';
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
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPlainWhite,
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: Container(
                color: Color(0xFF008073),
                padding: EdgeInsets.only(top: 30),
                height: size.height * 0.7,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 50,
                      color: kPlainWhite,
                    ),
                    SvgPicture.asset(
                      'assets/login_image.svg',
                      width: size.width,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Experience a fresh way to ',
                        style: TextStyle(
                          color: kPlainBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                        children: [
                          TextSpan(
                            text: 'manage money',
                            style: TextStyle(
                              color: kAquaGreen,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () async {
                        await _authController.signInWithGoogle();
                        print(_authController.loginState);
                        if (_authController.loginState == LoginState.success) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            kLocalAuthScreen,
                            (route) => false,
                          );
                        } else if (_authController.loginState ==
                            LoginState.error) {
                          print('adfdagadadg');
                          showAlertDialog(context);
                        }
                      },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: kLightGrey,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: kTimelineColor,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SvgPicture.asset(
                                'assets/google-icon.svg',
                                height: 26,
                              ),
                            ),
                            Container(
                              width: 1,
                              color: kTimelineColor,
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Entrar com Google',
                                  style: TextStyle(
                                    color: kPlainBlack,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
