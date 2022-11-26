import 'dart:convert';
import 'package:zelenbank/layers/data/datasources/get_transaction_by_id_datasource.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import '../../../../core/http_client/http_client_interface.dart';
import '../../../../core/utils/constants/api_endpoints_constants.dart';
import '../dtos/transaction_dto.dart';

class GetTransactionByIdRemoteDatasourceImpl
    implements GetTransactionByIdDatasource {
  final IHttpClient _httpClient;
  GetTransactionByIdRemoteDatasourceImpl(this._httpClient);

  @override
  Future<TransactionEntity> call(String id) async {
    final response = await _httpClient.get(
      url: '$kApiUrl/$kMyDtStatement/$id',
      header: {'Token': kApiToken},
    );

    final json = jsonDecode(response.body);

    final transaction = TransactionDto.fromMap(json);

    return transaction;
  }
}
