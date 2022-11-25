import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:zelenbank/core/http/http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/core/utils/constants/api_endpoints_constants.dart';
import 'package:zelenbank/layers/data/datasources/dtos/transaction_dto.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_current_balance_remote_datasource_impl.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_transaction_list_remote_datasource_impl.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late HttpClientModel httpClientModel;
  late GetTransactionListRemoteDatasourceImpl
      getTransactionListRemoteDatasourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    httpClientModel = HttpClientModel(mockHttpClient);
    getTransactionListRemoteDatasourceImpl =
        GetTransactionListRemoteDatasourceImpl(httpClientModel);
  });

  final int tPageNumber = 0;

  test('Should return a list of TransactionDto if the response is 200',
      () async {
    // arrange
    when(
      () => mockHttpClient.get(
          Uri.parse('$kApiUrl/$kMyStatement/$kRequestNumber/$tPageNumber'),
          headers: {'Token': kApiToken}),
    ).thenAnswer(
        (_) async => http.Response(fixture('transaction_list.json'), 200));

    // act
    final result = await getTransactionListRemoteDatasourceImpl(tPageNumber);

    // assert
    expect(result, isA<List<TransactionDto>>());
  });
}
