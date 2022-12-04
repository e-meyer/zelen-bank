import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/authentication/presentation/ui/components/login_button.dart';

void main() {
  LoginButton();

  testWidgets(
    'Widget renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(),
          child: MaterialApp(
            home: const Scaffold(body: LoginButton()),
          ),
        ),
      );

      //final BuildContext context = tester.element(find.byType(MaterialApp));

      //expect(MediaQuery.of(context).size.height, isA<double>(),
      //   reason: 'Screen size is a not a valid number');

      Finder outerContainer = find.byType(Container);
      final Size ocSize = tester.getSize(outerContainer);
      expect(ocSize.height, equals(56));

      Finder googleLogo = find.byType(SvgPicture);
      final Size glSize = tester.getSize(outerContainer);
      expect(glSize.height, equals(26));
    },
  );
}
