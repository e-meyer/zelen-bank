import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

abstract class GetTransactionByIdUsecase {
  Future<TransactionEntity> call(String id);
}
