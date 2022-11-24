import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import '../../domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase_impl.dart';

class TransactionController {
  final GetTransactionByIdUsecaseImpl _getTransactionById;
  List<TransactionEntity> tasksList = [];

  TransactionController(
    this._getTransactionById,
  );

  bool isReceived(TransactionEntity transaction) {
    return transaction.transactionType == "PIXCASHIN" ||
        transaction.transactionType == "TRANSACTIONIN";
  }

  Future<TransactionEntity> getById(String id) async {
    return await _getTransactionById.call(id);
  }
}
