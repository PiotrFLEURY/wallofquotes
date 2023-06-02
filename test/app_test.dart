import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/view/app/app.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:wallofquotes/view_model/providers.dart';

import 'mocks.mocks.dart';

void main() {
  final fakeCloudFirestore = FakeFirebaseFirestore();
  fakeCloudFirestore.collection('quotes').add(
        Quote(
          text: 'hello world',
          author: 'me',
        ).toJson(),
      );

  final fakeAnalyticsService = MockAnalyticsService();

  testWidgets('App should load quote to the first page',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      WallOfQuotes(
        overrides: [
          fireStoreProvider.overrideWithValue(fakeCloudFirestore),
          analyticsServiceProvider.overrideWithValue(fakeAnalyticsService),
        ],
      ),
    );

    expect(find.text('Loading...'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Hello world'), findsOneWidget);
  });

  // Open the app, press the add button, enter text, press the add button, and check that the text is there
  testWidgets('App should add a quote', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      WallOfQuotes(
        overrides: [
          fireStoreProvider.overrideWithValue(fakeCloudFirestore),
          analyticsServiceProvider.overrideWithValue(fakeAnalyticsService),
        ],
      ),
    );

    expect(find.text('Loading...'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Hello world'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));

    await tester.pumpAndSettle();

    // text
    expect(find.bySemanticsLabel(RegExp(r'Quote text')), findsOneWidget);

    await tester.enterText(
      find.bySemanticsLabel(RegExp(r'Quote text')),
      'Hello world 2',
    );

    // author
    expect(find.bySemanticsLabel(RegExp(r'Quote author')), findsOneWidget);

    await tester.enterText(
      find.bySemanticsLabel(RegExp(r'Quote author')),
      'me',
    );

    await tester.tap(
      find.bySemanticsLabel(RegExp(r'Add quote button')),
    );

    await tester.pumpAndSettle();
  });
}
