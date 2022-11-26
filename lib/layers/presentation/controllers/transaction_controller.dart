import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase.dart';

class TransactionController extends ChangeNotifier {
  final GetTransactionListUsecase _getTransactionListUsecase;
  final GetCurrentBalanceUsecase _getCurrentBalanceUsecase;
  final GetTransactionByIdUsecase _getTransactionByIdUsecase;
  List<TransactionEntity> _transactionList = [];
  late double _balance;

  TransactionController(
    this._getTransactionListUsecase,
    this._getCurrentBalanceUsecase,
    this._getTransactionByIdUsecase,
  );

  double get balance => _balance;
  List<TransactionEntity> get transactionList => _transactionList;

  void fetchBalance() async {
    _balance = await _getCurrentBalanceUsecase();
    notifyListeners();
  }

  void getTransactionsList(int pageNumber) async {
    final list = await _getTransactionListUsecase(pageNumber);
    for (var transaction in list) {
      _transactionList.add(transaction);
    }
    notifyListeners();
  }

  bool isReceived(TransactionEntity transaction) {
    return transaction.transactionType == "PIXCASHIN" ||
        transaction.transactionType == "TRANSACTIONIN";
  }

  Future<TransactionEntity> getById(String id) async {
    return await _getTransactionByIdUsecase(id);
  }
}
