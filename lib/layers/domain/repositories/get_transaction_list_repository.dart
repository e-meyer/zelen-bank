import '../entities/transaction_entity.dart';

abstract class GetTrasactionListRepository {
  Future<List<TransactionEntity>> call(int pageNumber);
}
