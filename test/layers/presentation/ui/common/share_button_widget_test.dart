import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/layers/presentation/ui/common/custom_button_widget.dart';

void main() {
  int count = 0;
  GlobalKey<State<StatefulWidget>> previewContainer =
      GlobalKey<State<StatefulWidget>>();
  testWidgets('Test widget functionality', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: Scaffold(
            body: CustomButtonWidget(
              label: 'test',
              previewContainer: previewContainer,
              onTap: () => count++,
            ),
          ),
        ),
      ),
    );

    var button = find.byType(ElevatedButton);
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(count, 1);
  });
}
