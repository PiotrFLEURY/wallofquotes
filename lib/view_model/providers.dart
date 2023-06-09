import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/data_sources/firebase_db.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/services/analytics_service.dart';
import 'package:wallofquotes/view_model/notifiers/quotes_notifier.dart';
import 'package:wallofquotes/view_model/notifiers/random_quote_notifier.dart';

final fireStoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final firebaseDbProvider = Provider<FirebaseDb>(
  (ref) => FirebaseDb(
    ref.read(fireStoreProvider),
  ),
);

final quotesProvider = StateNotifierProvider<QuotesNotifier, List<Quote>>(
  (ref) => QuotesNotifier(
    ref.read(firebaseDbProvider),
  )..fetchQuotes(),
);

final randomQuoteProvider = StateNotifierProvider<RandomQuoteNotifier, Quote?>(
  (ref) => RandomQuoteNotifier(ref.watch(quotesProvider))..fetchRandomQuote(),
);

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  return AnalyticsService(
    analytics: FirebaseAnalytics.instance,
  );
});
