import 'package:zelenbank/layers/data/datasources/dtos/transaction_dto.dart';

import '../../../../core/http/http_client.dart';
import '../get_transaction_list_datasource.dart';

class GetTransactionListRemoteDatasourceImpl implements GetTransactionListDatasource {
  final HttpClientModel _httpClient;
  GetTransactionListRemoteDatasourceImpl(this._httpClient);

  @override
  Future<List<TransactionDto>> call(int pageNumber) async {
    final json = await _httpClient.getTransactionsList(pageNumber);

    List<TransactionDto> list = [];

    for (var item in json['items']) {
      final transaction = TransactionDto.fromJson(item);

      list.add(transaction);
    }

    return list;
  }
}
