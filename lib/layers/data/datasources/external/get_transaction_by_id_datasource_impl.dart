import 'package:zelenbank/core/http/http_client.dart';
import 'package:zelenbank/layers/data/datasources/get_transaction_by_id_datasource.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

class GetTransactionByIdDatasourceImpl implements GetTransactionByIdDatasource {
  final HttpClientModel _httpClientModel;
  GetTransactionByIdDatasourceImpl(this._httpClientModel);

  @override
  Future<TransactionEntity> call(String id) {
    return _httpClientModel.getTransactionById(id);
  }
}
