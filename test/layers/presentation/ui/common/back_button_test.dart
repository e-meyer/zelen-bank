import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  testWidgets('Button is present and triggers navigation after tapped',
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: CustomBackButton()),
        navigatorObservers: [mockObserver],
      ),
    );

    var button = find.byType(IconButton);

    expect(button, findsOneWidget);
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    verify(() => mockObserver.didPop(any(), any()));
    await tester.pumpAndSettle();
  });
}
