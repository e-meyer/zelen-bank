import 'package:zelenbank/layers/data/datasources/dtos/transaction_dto.dart';

abstract class GetTransactionListDatasource {
  Future<List<TransactionDto>> call(int pageNumber);
}
