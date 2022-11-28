import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase.dart';
import '../../domain/usecases/change_balance_visibility/change_balance_visibility_usecase.dart';
import '../../domain/usecases/get_balance_visibility/get_balance_visibility_usecase.dart';
import '../../domain/usecases/get_current_balance_usecase/get_current_balance_usecase.dart';
import '../../../../../core/utils/constants/transaction_type_constants.dart'
    show transferInTypes;

class TransactionController extends ChangeNotifier {
  final GetTransactionListUsecase _getTransactionListUsecase;
  final GetTransactionByIdUsecase _getTransactionByIdUsecase;
  final GetCurrentBalanceUsecase _getCurrentBalanceUsecase;
  final ChangeBalanceVisibilityUsecase _changeBalanceVisibilityUsecase;
  final GetBalanceVisibilityUsecase _getBalanceVisibilityUsecase;
  final List<TransactionEntity> _transactionList = [];
  double _balance = 0;
  bool isBalanceVisible = true;

  TransactionController(
    this._getTransactionListUsecase,
    this._getTransactionByIdUsecase,
    this._getCurrentBalanceUsecase,
    this._changeBalanceVisibilityUsecase,
    this._getBalanceVisibilityUsecase,
  );

  List<TransactionEntity> get transactionList => _transactionList;

  double get balance => _balance;

  void getTransactionsList(int pageNumber) async {
    final list = await _getTransactionListUsecase(pageNumber);
    for (var transaction in list) {
      _transactionList.add(transaction);
    }
    notifyListeners();
  }

  bool isReceived(TransactionEntity transaction) {
    String transactionType = transaction.transactionType;
    return transferInTypes.contains(transactionType);
  }

  Future<TransactionEntity> getById(String id) async {
    return await _getTransactionByIdUsecase(id);
  }

  void getCurrentBalance() async {
    _balance = await _getCurrentBalanceUsecase();
    notifyListeners();
  }

  void getBalanceVisibility() async {
    isBalanceVisible = await _getBalanceVisibilityUsecase();
    notifyListeners();
  }

  void changeBalanceVisibility() async {
    await _changeBalanceVisibilityUsecase(isBalanceVisible);
    isBalanceVisible = !isBalanceVisible;
    notifyListeners();
  }
}
