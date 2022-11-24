import 'dtos/transaction_dto.dart';

abstract class GetTransactionByIdDatasource {
  Future<TransactionDto> call(String id);
}
