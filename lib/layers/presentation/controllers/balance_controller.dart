import 'package:flutter/material.dart';

import '../../domain/usecases/get_current_balance_usecase/get_current_balance_usecase.dart';

class BalanceController extends ChangeNotifier {
  final GetCurrentBalanceUsecase _getCurrentBalanceUsecase;
  double _balance = 0;

  BalanceController(
    this._getCurrentBalanceUsecase,
  );

  double get balance => _balance;

  void fetchBalance() async {
    _balance = await _getCurrentBalanceUsecase();
    notifyListeners();
  }
}
