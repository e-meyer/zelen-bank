import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase.dart';

class TransactionController {
  final GetTrasactionListUsecase _getTrasactionListUsecase;
  List<TransactionEntity> tasksList = [];

  TransactionController(
    this._getTrasactionListUsecase,
  );

  bool isReceived(TransactionEntity transaction) {
    return transaction.transactionType == "PIXCASHIN" ||
        transaction.transactionType == "TRANSACTIONIN";
  }

  Future<TransactionEntity> getById(String id) async {
    throw UnimplementedError();
    //return await _getTransactionById(id);
  }
}
