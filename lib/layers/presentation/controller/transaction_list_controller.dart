import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase_impl.dart';

class AllTransactionsController {
  final GetTransactionListUsecaseImpl _getTrasactionListUsecase;
  List<TransactionEntity> tasksList = [];

  AllTransactionsController(
    this._getTrasactionListUsecase,
  );

  Future<List> getAllTransactions(int pageNumber) async {
    return await _getTrasactionListUsecase.call(pageNumber);
  }
}
