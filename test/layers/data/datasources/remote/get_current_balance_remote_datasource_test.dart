import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:zelenbank/core/http_client/http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/core/utils/constants/api_endpoints_constants.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_current_balance_remote_datasource_impl.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late HttpClient httpClientModel;
  late GetCurrentBalanceRemoteDatasourceImpl getCurrentBalanceDatasource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    httpClientModel = HttpClient(mockHttpClient);
    getCurrentBalanceDatasource =
        GetCurrentBalanceRemoteDatasourceImpl(httpClientModel);
  });

  test('Should return a double number if the response is 200', () async {
    // arrange
    when(
      () => mockHttpClient.get(Uri.parse('$kApiUrl/$kMyBalance'),
          headers: {'Token': kApiToken}),
    ).thenAnswer((_) async => http.Response(fixture('transaction.json'), 200));

    // act
    final result = await getCurrentBalanceDatasource();

    // assert
    expect(result, isA<Right>());
  });
}
