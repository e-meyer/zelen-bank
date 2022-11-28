import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/presentation/ui/transaction_details/components/transaction_details_field_widget.dart';

void main() {
  TransactionDetailsFieldWidget transactionDetailsFieldWidget =
      const TransactionDetailsFieldWidget(
    fieldTitle: 'fieldTitle',
    fieldDescription: 'fieldDescription',
  );

  group('test transaction details widget', () {
    test('test transaction fieldTitle', () {
      expect(transactionDetailsFieldWidget.fieldTitle, 'fieldTitle');
    });
    test('test transaction fieldDescription', () {
      expect(
          transactionDetailsFieldWidget.fieldDescription, 'fieldDescription');
    });
    test('test field Title is not null', () {
      expect(transactionDetailsFieldWidget.fieldTitle, isNotNull);
    });
  });
}
