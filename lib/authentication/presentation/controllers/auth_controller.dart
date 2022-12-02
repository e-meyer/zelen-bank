import 'package:flutter/material.dart';
import 'package:zelenbank/authentication/domain/usecases/check_user_auth_status_usecase.dart';

enum LoginState { idle, loading, success, error }

class AuthController extends ChangeNotifier {
  final CheckUserAuthStatusUsecase _checkUserAuthStatusUsecase;
  var loginState = LoginState.idle;

  AuthController(this._checkUserAuthStatusUsecase);

  isUserLoggedIn() {
    return _checkUserAuthStatusUsecase();
    // _result.fold(
    //   (l) {
    //     loginState = LoginState.error;
    //     // return l;
    //   },
    //   (r) {
    //     return r;
    //   },
    // );
  }
}
