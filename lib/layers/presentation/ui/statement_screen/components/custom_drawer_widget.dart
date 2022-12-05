import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

import '../../../../../authentication/presentation/controllers/auth_controller.dart';
import '../../../../../core/injector/injector.dart';
import '../../../../../core/utils/constants/route_constants.dart';

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({super.key});

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  final AuthController authController = serviceLocator.get<AuthController>();
  bool light = true;

  // toggleTheme() {
  //   isThemeDark.value = !isThemeDark.value;
  //   // aqui ficara funcao para trocar tema
  //   if (tema.value == ThemeMode.system || tema.value == ThemeMode.light) {
  //     tema.value = ThemeMode.dark;
  //   } else {
  //     tema.value = ThemeMode.light;
  //   }
  //   print(tema.value);
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                        height: 85,
                        width: 85,
                        child: // Image.network(
                            // authController.currentUser.profilePhotoUrl,
                            //errorBuilder: (context, error, stackTrace) {
                            // return
                            SvgPicture.asset(
                          'assets/person_photo_placeholder.svg',
                          fit: BoxFit.fitHeight,
                        )
                        //},
                        //fit: BoxFit.fitHeight,
                        //),
                        ),
                  ),
                  const Text(
                    'Nome user', //authController.currentUser.name,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Icon(
              authController.isUserThemeDark
                  ? Icons.sunny
                  : Icons.wb_twighlight,
              color: kAquaGreen,
            ),
            onTap: () {
              setState(() {
                authController.changeUserThemeMode();
              });
            },
            title: Text(
              '${isThemeMode()} Theme',
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: -0.3,
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: const Icon(
              Icons.fingerprint,
              color: kAquaGreen,
            ),
            title: const Text(
              'Always ask for fingerprint',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: -0.3,
              ),
            ),
            trailing: const Text('On'),
            onTap: () {},
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    authController.signOutGoogle();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      kLoginScreen,
                      (route) => false,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Sign out',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String isThemeMode() {
    if (!authController.isUserThemeDark) {
      return 'Light';
    }
    return 'Dark';
  }
}
// ValueListenableBuilder<bool>(
//         valueListenable: isThemeDark,
//         builder: (context, value, child) {
//           return IconButton(
//             icon: Icon(
//                 isThemeDark.value ? Icons.lightbulb : Icons.lightbulb_outline),
//             onPressed: toggleTheme,
//           );
//         },
//       ),
