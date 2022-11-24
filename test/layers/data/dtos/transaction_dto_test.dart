import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/core/http/http_client.dart';
import 'package:zelenbank/layers/data/datasources/dtos/transaction_dto.dart';
import 'package:zelenbank/layers/data/datasources/get_transaction_by_id_datasource.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_transaction_by_id_remote_datasource_impl.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements HttpClientModel {}

void main() {
  late HttpClientModel mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
  });

  final date = DateTime.parse('2020-11-29T03:00:00Z');

  final tTransactionDto = TransactionDto(
    id: '0B5BFD44-0DF1-4005-A7CF-66C9C0438380',
    createdAt: date,
    amount: 1384,
    transactionType: 'TRANSFEROUT',
    description: 'Transferência realizada',
    targetName: 'Luisa Sacura',
  );

  test(
    'Should be a subclass of TransactionEntity',
    () async {
      // assert
      expect(tTransactionDto, isA<TransactionEntity>());
    },
  );

  group('fromMap', () {
    test('Should return a parsed TransactionDto object', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('transaction.json'));

      // act
      final result = TransactionDto.fromMap(jsonMap);

      // assert
      expect(result, tTransactionDto);
    });
  });
}
