import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/view/pages/quotes/widgets/widgets.dart';
import 'package:wallofquotes/view/style/colors.dart';

void main() {
  testGoldens('QuoteTile displays a quote', (WidgetTester tester) async {
    // Build the widget
    final widget = Container(
      color: mainColor,
      child: QuoteTile(
        quote: Quote(
          text: 'Be the change you wish to see in the world',
          author: 'Mahatma Gandhi',
        ),
      ),
    );

    // Pump the widget and build the golden image
    await tester.pumpWidgetBuilder(
      widget,
      surfaceSize: const Size(390, 100),
    );
    await screenMatchesGolden(tester, 'quote_tile');

    // Verify that the quote and author are displayed
    expect(
      find.text('Be the change you wish to see in the world'),
      findsOneWidget,
    );
  });
}
