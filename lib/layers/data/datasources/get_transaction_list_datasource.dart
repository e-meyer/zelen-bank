import '../../domain/entities/transaction_entity.dart';

abstract class GetTrasactionListDatasource {
  Future<List<TransactionEntity>> call(int pageNumber);
}
