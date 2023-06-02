import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/view/pages/quotes/widgets/widgets.dart';
import 'package:wallofquotes/view/style/colors.dart';
import 'package:wallofquotes/view_model/providers.dart';

void main() {
  final fakeCloudFirestore = FakeFirebaseFirestore();

  // 5 random quote strings in an array
  final quotes = [
    'hello world',
    'hello world',
    'hello world',
    'hello world',
    'hello world',
  ];
  for (var element in quotes) {
    fakeCloudFirestore.collection('quotes').add(
          Quote(
            text: element,
            author: 'me',
          ).toJson(),
        );
  }

  testGoldens('QuoteList should match golden file', (tester) async {
    final widget = ProviderScope(
      overrides: [
        fireStoreProvider.overrideWithValue(fakeCloudFirestore),
      ],
      child: Container(
        color: mainColor,
        child: const Scaffold(
          body: QuoteList(),
        ),
      ),
    );

    // Pump the widget and build the golden image
    await tester.pumpWidgetBuilder(
      widget,
      // iPhone 13
      surfaceSize: const Size(390, 844),
    );

    await screenMatchesGolden(tester, 'quote_list');
  });
}
