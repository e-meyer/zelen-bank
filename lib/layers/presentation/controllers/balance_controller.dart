import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/usecases/change_balance_visibility/change_balance_visibility_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_balance_visibility/get_balance_visibility_usecase.dart';

import '../../domain/usecases/get_current_balance_usecase/get_current_balance_usecase.dart';

class BalanceController extends ChangeNotifier {
  final GetCurrentBalanceUsecase _getCurrentBalanceUsecase;
  final ChangeBalanceVisibilityUsecase _changeBalanceVisibilityUsecase;
  final GetBalanceVisibilityUsecase _getBalanceVisibilityUsecase;
  double _balance = 0;
  bool isBalanceVisible = true;

  BalanceController(
    this._getCurrentBalanceUsecase,
    this._changeBalanceVisibilityUsecase,
    this._getBalanceVisibilityUsecase,
  );

  double get balance => _balance;

  void fetchBalance() async {
    _balance = await _getCurrentBalanceUsecase();
    notifyListeners();
  }

  void getBalanceVisibility() async {
    isBalanceVisible = await _getBalanceVisibilityUsecase();
    notifyListeners();
  }

  void changeBalanceVisibility() async {
    isBalanceVisible = await _changeBalanceVisibilityUsecase(isBalanceVisible);
    notifyListeners();
  }
}
