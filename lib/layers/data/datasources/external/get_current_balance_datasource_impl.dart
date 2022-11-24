import 'package:zelenbank/layers/data/datasources/get_current_balance_datasource.dart';

import '../../../../core/http/http_client.dart';

class GetCurrentBalanceDatasourceImpl implements GetCurrentBalanceDatasource {
  final HttpClientModel _httpClient;
  GetCurrentBalanceDatasourceImpl(this._httpClient);

  @override
  Future<double> call() {
    return _httpClient.getCurrentBalance();
  }
}
