import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/presentation/ui/transaction_details/components/custon_button_widget.dart';

void main() {
  int count = 0;
  GlobalKey<State<StatefulWidget>> previewContainer =
      GlobalKey<State<StatefulWidget>>();
  CustonButtonWidget custonButtonWidget = CustonButtonWidget(
    label: 'test',
    onTap: () => count++,
    previewContainer: previewContainer,
  );
  test('test button label', () {
    expect(custonButtonWidget.label, 'test');
  });

  test('test button click', () {
    expect(count, 0);
    custonButtonWidget.onTap!();
    expect(count, 1);
    custonButtonWidget.onTap!();
    expect(count, 2);
    custonButtonWidget.onTap!();
    expect(count, 3);
  });

  test('test button preview', () {
    expect(custonButtonWidget.previewContainer, previewContainer);
  });
}
