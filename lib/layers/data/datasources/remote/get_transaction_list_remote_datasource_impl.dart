import 'dart:convert';

import 'package:zelenbank/layers/data/datasources/dtos/transaction_dto.dart';

import '../../../../core/utils/constants/api_endpoints_constants.dart';
import '../../../../core/http_client/http_client_interface.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../get_transaction_list_datasource.dart';

class GetTransactionListRemoteDatasourceImpl
    implements GetTransactionListDatasource {
  final IHttpClient _httpClient;
  GetTransactionListRemoteDatasourceImpl(this._httpClient);

  @override
  Future<List<TransactionEntity>> call(int pageNumber) async {
    final response = await _httpClient.get(
      url: '$kApiUrl/$kMyStatement/$kRequestNumber/$pageNumber',
      header: {'Token': kApiToken},
    );

    final json = jsonDecode(response.body);

    List<TransactionDto> list = [];

    for (var item in json['items']) {
      final transaction = TransactionDto.fromMap(item);
      list.add(transaction);
    }

    return list;
  }
}
