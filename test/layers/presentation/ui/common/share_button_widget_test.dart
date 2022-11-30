import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/presentation/ui/common/custom_button_widget.dart';

void main() {
  int count = 0;
  GlobalKey<State<StatefulWidget>> previewContainer =
      GlobalKey<State<StatefulWidget>>();
  CustomButtonWidget customButtonWidget = CustomButtonWidget(
    label: 'test',
    onTap: () => count++,
    previewContainer: previewContainer,
  );
  test('test button label', () {
    expect(customButtonWidget.label, 'test');
  });

  test('test button click', () {
    expect(count, 0);
    customButtonWidget.onTap!();
    expect(count, 1);
    customButtonWidget.onTap!();
    expect(count, 2);
    customButtonWidget.onTap!();
    expect(count, 3);
  });

  test('test button preview', () {
    expect(customButtonWidget.previewContainer, previewContainer);
  });
}
