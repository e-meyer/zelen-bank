import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

abstract class GetTransactionByIdDatasource {
  Future<TransactionEntity> call(String id);
}
