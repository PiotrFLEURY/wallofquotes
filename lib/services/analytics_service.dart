import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  const AnalyticsService({required this.analytics});

  final FirebaseAnalytics analytics;

  Future<void> logAddQuote() async {
    await analytics.logEvent(
      name: 'add_quote',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> logSaveQuote() async {
    await analytics.logEvent(
      name: 'save_quote',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> logFireQuote() async {
    await analytics.logEvent(
      name: 'fire_quote',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> logLikeQuote() async {
    analytics.logEvent(
      name: 'like_quote',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> logDislikeQuote() async {
    analytics.logEvent(
      name: 'dislike_quote',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> logReportQuote() async {
    analytics.logEvent(
      name: 'report_quote',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> logSwipe() async {
    analytics.logEvent(
      name: 'swipe',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<void> logRefreshQuotes() async {
    analytics.logEvent(
      name: 'refresh_quotes',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }
}
