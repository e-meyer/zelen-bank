import '../entities/transaction_entity.dart';

abstract class GetTransactionListRepository {
  Future<List<TransactionEntity>> call(int pageNumber);
}
