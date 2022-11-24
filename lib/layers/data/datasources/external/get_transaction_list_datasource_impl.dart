import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

import '../../../../core/http/http_client.dart';
import '../get_transaction_list_datasource.dart';

class GetTrasactionListDatasourceImpl implements GetTrasactionListDatasource {
  final HttpClientModel _httpClient;
  GetTrasactionListDatasourceImpl(this._httpClient);

  @override
  Future<List<TransactionEntity>> call(int pageNumber) {
    return _httpClient.getTransactionsList(pageNumber);
  }
}
