import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wallofquotes/view/pages/add/add_quote_page.dart';

void main() {
  testGoldens('AddQuotePage displays a quote', (WidgetTester tester) async {
    // Build the widget
    const widget = AddQuotePage();

    // Pump the widget and build the golden image
    await tester.pumpWidgetBuilder(
      widget,
      wrapper: materialAppWrapper(theme: ThemeData.light()),
      // iPhone 13 size
      surfaceSize: const Size(390, 844),
    );

    await screenMatchesGolden(tester, 'add_quote_page');
  });
}
