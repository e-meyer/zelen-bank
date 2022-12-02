import 'package:flutter/material.dart';
import 'package:zelenbank/authentication/domain/usecases/check_user_auth_status/check_user_auth_status_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_in_with_google/sign_in_with_google_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_out/sign_out_google_usecase.dart';

enum LoginState { idle, loading, success, error }

class AuthController extends ChangeNotifier {
  final CheckUserAuthStatusUsecase _checkUserAuthStatusUsecase;
  final SignInWithGoogleUsecase _signInWithGoogleUsecase;
  final SignOutGoogleUsecase _signOutGoogleUsecase;
  var isLogged = false;
  var loginState = LoginState.idle;

  AuthController(
    this._checkUserAuthStatusUsecase,
    this._signInWithGoogleUsecase,
    this._signOutGoogleUsecase,
  );

  isUserLoggedIn() {
    isLogged = _checkUserAuthStatusUsecase();
    notifyListeners();
  }

  signInWithGoogle() async {
    loginState = LoginState.idle;
    notifyListeners();
    final _result = await _signInWithGoogleUsecase();

    _result.fold((l) {
      loginState = LoginState.error;
    }, (r) {
      loginState = LoginState.success;
    });
    notifyListeners();
  }

  signOutGoogle() async {
    await _signOutGoogleUsecase();
  }
}
