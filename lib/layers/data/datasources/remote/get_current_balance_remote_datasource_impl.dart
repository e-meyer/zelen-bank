import 'package:zelenbank/layers/data/datasources/get_current_balance_datasource.dart';

import '../../../../core/http/http_client.dart';

class GetCurrentBalanceRemoteDatasourceImpl
    implements GetCurrentBalanceDatasource {
  final HttpClientModel _httpClient;
  GetCurrentBalanceRemoteDatasourceImpl(this._httpClient);

  @override
  Future<double> call() async {
    return await _httpClient.getCurrentBalance();
  }
}
