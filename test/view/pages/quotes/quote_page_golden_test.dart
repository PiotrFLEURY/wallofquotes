import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/mockito.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/services/analytics_service.dart';
import 'package:wallofquotes/view/pages/quotes/widgets/random_quote.dart';
import 'package:wallofquotes/view_model/providers.dart';

import '../../../mocks.mocks.dart';

void main() async {
  testGoldens('RandomQuote displays a quote', (WidgetTester tester) async {
    // Create a fake quote list
    final quotes = [
      Quote(
        text: 'Be the change you wish to see in the world',
        author: 'Mahatma Gandhi',
      )
    ];

    // Create a mock of FirebaseDb
    final firebaseDbMock = MockFirebaseDb();
    when(firebaseDbMock.fetchQuotes()).thenAnswer(
      (_) => Future.value(quotes),
    );

    final fakeFirebaseAnalytics = MockFirebaseAnalytics();

    // Build the widget
    final widget = ProviderScope(
      overrides: [
        firebaseDbProvider.overrideWithValue(firebaseDbMock),
        analyticsServiceProvider.overrideWithValue(
          AnalyticsService(
            analytics: fakeFirebaseAnalytics,
          ),
        ),
      ],
      child: const RandomQuote(),
    );

    // Pump the widget and build the golden image
    await tester.pumpWidgetBuilder(
      widget,
      wrapper: materialAppWrapper(theme: ThemeData.light()),
      // iPhone 13 size
      surfaceSize: const Size(390, 844),
    );

    await screenMatchesGolden(tester, 'random_quote');
  });
}
