import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

abstract class GetTrasactionListUsecase {
  Future<List<TransactionEntity>> call(int pageNumber);
}
