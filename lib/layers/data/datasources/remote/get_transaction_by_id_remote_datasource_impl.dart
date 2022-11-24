import 'package:zelenbank/core/http/http_client.dart';
import 'package:zelenbank/layers/data/datasources/get_transaction_by_id_datasource.dart';

import '../dtos/transaction_dto.dart';

class GetTransactionByIdRemoteDatasourceImpl
    implements GetTransactionByIdDatasource {
  final HttpClientModel _httpClient;
  GetTransactionByIdRemoteDatasourceImpl(this._httpClient);

  @override
  Future<TransactionDto> call(String id) async {
    final json = await _httpClient.getTransactionById(id);

    final transaction = TransactionDto.fromJson(json);

    return transaction;
  }
}
