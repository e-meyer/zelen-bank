import '../../domain/entities/transaction_entity.dart';

abstract class GetTransactionListDatasource {
  Future<List<TransactionEntity>> call(int pageNumber);
}
