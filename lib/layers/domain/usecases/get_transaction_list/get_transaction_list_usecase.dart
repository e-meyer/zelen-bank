import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

abstract class GetTransactionListUsecase {
  Future<List<TransactionEntity>> call(int pageNumber);
}
