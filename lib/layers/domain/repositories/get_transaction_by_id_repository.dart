import '../entities/transaction_entity.dart';

abstract class GetTransactionByIdRepository {
  Future<TransactionEntity> call(String id);
}
