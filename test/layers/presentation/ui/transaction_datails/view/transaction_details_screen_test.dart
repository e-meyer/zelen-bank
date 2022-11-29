import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/presentation/ui/transaction_details/view/transaction_details_screen.dart';

class MockTransactionDetails extends TransactionDetails {
  const MockTransactionDetails({super.key}) : super('');
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() {
  // testar widget
  testWidgets('TransactionDetailsScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MockTransactionDetails());
    expect(find.byType(TransactionDetails), findsOneWidget);
  });
}
