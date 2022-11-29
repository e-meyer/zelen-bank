import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import '../../../fixtures/fixture_reader.dart';
import 'dart:mirrors';

void main() {
  final tTransaction = TransactionEntity(
    id: '0B5BFD44-0DF1-4005-A7CF-66C9C0438380',
    createdAt: DateTime.parse('2020-11-29T03:00:00Z'),
    amount: 1384,
    transactionType: 'TRANSFEROUT',
    description: 'Transferência realizada',
    targetName: 'Luisa Sacura',
  );

  group('Props method', () {
    var value = tTransaction.props;
    test('Props must return a list', () {
      expect(value.runtimeType, isList);
    });
    test('Must include all required fields', () {
      //setup matcher

      expect(value.length, greaterThanOrEqualTo(6));
    });
  });
}
