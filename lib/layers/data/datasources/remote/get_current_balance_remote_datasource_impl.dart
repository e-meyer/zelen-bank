import 'dart:convert';

import 'package:zelenbank/core/http_client/http_client_interface.dart';
import 'package:zelenbank/core/utils/constants/api_endpoints_constants.dart';
import 'package:zelenbank/layers/data/datasources/get_current_balance_datasource.dart';

class GetCurrentBalanceRemoteDatasourceImpl
    implements GetCurrentBalanceDatasource {
  final IHttpClient _httpClient;
  GetCurrentBalanceRemoteDatasourceImpl(this._httpClient);

  @override
  Future<double> call() async {
    final response = await _httpClient.get(
      url: '$kApiUrl/$kMyBalance',
      header: {'Token': kApiToken},
    );

    final json = jsonDecode(response.body);

    final currentBalance = json['amount'].toDouble();

    return currentBalance;
  }
}
