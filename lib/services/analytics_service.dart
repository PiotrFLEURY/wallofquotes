import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final analytics = FirebaseAnalytics.instance;

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

  void logFireQuote() {
    analytics.logEvent(
      name: 'fire_quote',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  void logLikeQuote() {
    analytics.logEvent(
      name: 'like_quote',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  void logDislikeQuote() {
    analytics.logEvent(
      name: 'dislike_quote',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  void logReportQuote() {
    analytics.logEvent(
      name: 'report_quote',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  void logSwipe() {
    analytics.logEvent(
      name: 'swipe',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  void logRefreshQuotes() {
    analytics.logEvent(
      name: 'refresh_quotes',
      parameters: <String, dynamic>{
        'time': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }
}
