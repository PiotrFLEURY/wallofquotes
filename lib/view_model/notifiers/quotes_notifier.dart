import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/data_sources/firebase_db.dart';
import 'package:wallofquotes/model/quote.dart';

class QuotesNotifier extends StateNotifier<List<Quote>> {
  QuotesNotifier(this._firebaseDb) : super([]);

  final FirebaseDb _firebaseDb;

  void fetchQuotes() {
    _firebaseDb.fetchQuotes().then((quotes) {
      state = quotes;
    });
  }

  void addQuote(Quote quote) {
    state = [...state, quote];

    _firebaseDb.addQuote(quote);
  }

  void updateQuote(Quote quote) {
    state = [
      for (final q in state)
        if (q.id == quote.id) quote else q,
    ];

    _firebaseDb.updateQuote(quote);
  }

  void fireQuote(Quote quote) {
    updateQuote(quote.copyWith(hotness: quote.hotness + 1));
  }

  void likeQuote(Quote quote) {
    updateQuote(quote.copyWith(likes: quote.likes + 1));
  }

  void dislikeQuote(Quote quote) {
    updateQuote(quote.copyWith(dislikes: quote.dislikes + 1));
  }

  void reportQuote(Quote quote) {
    updateQuote(quote.copyWith(reports: quote.reports + 1));
  }
}
