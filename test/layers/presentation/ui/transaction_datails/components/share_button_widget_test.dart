import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/presentation/ui/transaction_details/components/custon_button_widget.dart';

void main() {
  test('test button click', () {
    int count = 0;
    GlobalKey previewContainer = GlobalKey();
    CustonButtonWidget custonButtonWidget = CustonButtonWidget(
      label: 'test',
      onTap: () => count++,
      previewContainer: previewContainer,
    );
    expect(custonButtonWidget.label, 'test');
  });
}
