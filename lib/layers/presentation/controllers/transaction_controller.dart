import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase.dart';
import '../../../../../core/utils/constants/transaction_type_constants.dart'
    show transferInTypes;

class TransactionController extends ChangeNotifier {
  final GetTransactionListUsecase _getTransactionListUsecase;
  final GetTransactionByIdUsecase _getTransactionByIdUsecase;
  final List<TransactionEntity> _transactionList = [];

  TransactionController(
    this._getTransactionListUsecase,
    this._getTransactionByIdUsecase,
  );

  List<TransactionEntity> get transactionList => _transactionList;

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
}
