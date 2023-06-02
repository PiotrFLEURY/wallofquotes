import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wallofquotes/services/analytics_service.dart';

import '../mocks.mocks.dart';

void main() {
  group('AnalyticsService', () {
    var fakeFirebaseAnalytics = MockFirebaseAnalytics();
    AnalyticsService analyticsService = AnalyticsService(
      analytics: fakeFirebaseAnalytics,
    );

    test('logAddQuote should log an event', () async {
      await analyticsService.logAddQuote();

      // Verify that the logEvent method is called with the expected parameters
      verify(
        fakeFirebaseAnalytics.logEvent(
          name: 'add_quote',
          parameters: anyNamed('parameters'),
        ),
      ).called(1);
    });

    // logSaveQuote
    test('logSaveQuote should log an event', () async {
      await analyticsService.logSaveQuote();

      // Verify that the logEvent method is called with the expected parameters
      verify(
        fakeFirebaseAnalytics.logEvent(
          name: 'save_quote',
          parameters: anyNamed('parameters'),
        ),
      ).called(1);
    });

    // logFireQuote
    test('logFireQuote should log an event', () async {
      await analyticsService.logFireQuote();

      // Verify that the logEvent method is called with the expected parameters
      verify(
        fakeFirebaseAnalytics.logEvent(
          name: 'fire_quote',
          parameters: anyNamed('parameters'),
        ),
      ).called(1);
    });

    // logLikeQuote
    test('logLikeQuote should log an event', () async {
      await analyticsService.logLikeQuote();

      // Verify that the logEvent method is called with the expected parameters
      verify(
        fakeFirebaseAnalytics.logEvent(
          name: 'like_quote',
          parameters: anyNamed('parameters'),
        ),
      ).called(1);
    });

    // logDislikeQuote
    test('logDislikeQuote should log an event', () async {
      await analyticsService.logDislikeQuote();

      // Verify that the logEvent method is called with the expected parameters
      verify(
        fakeFirebaseAnalytics.logEvent(
          name: 'dislike_quote',
          parameters: anyNamed('parameters'),
        ),
      ).called(1);
    });

    // logReportQuote
    test('logReportQuote should log an event', () async {
      await analyticsService.logReportQuote();

      // Verify that the logEvent method is called with the expected parameters
      verify(
        fakeFirebaseAnalytics.logEvent(
          name: 'report_quote',
          parameters: anyNamed('parameters'),
        ),
      ).called(1);
    });

    // logSwipe
    test('logSwipe should log an event', () async {
      await analyticsService.logSwipe();

      // Verify that the logEvent method is called with the expected parameters
      verify(
        fakeFirebaseAnalytics.logEvent(
          name: 'swipe',
          parameters: anyNamed('parameters'),
        ),
      ).called(1);
    });

    // logRefreshQuotes
    test('logRefreshQuotes should log an event', () async {
      await analyticsService.logRefreshQuotes();

      // Verify that the logEvent method is called with the expected parameters
      verify(
        fakeFirebaseAnalytics.logEvent(
          name: 'refresh_quotes',
          parameters: anyNamed('parameters'),
        ),
      ).called(1);
    });
  });
}
