import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/data_sources/firebase_db.dart';
import 'package:wallofquotes/model/quote.dart';

class QuotesNotifier extends StateNotifier<List<Quote>> {
  QuotesNotifier(this._firebaseDb) : super([]);

  final FirebaseDb _firebaseDb;

  void fetchQuotes() {
    if (state.isNotEmpty) return;
    _refreshQuotes();
  }

  // refresh quotes
  Future<void> _refreshQuotes() async {
    final freshQuotes = await _firebaseDb.fetchQuotes();
    state = freshQuotes;
  }

  Future<void> addQuote(Quote quote) async {
    // add quote to list
    state = [
      ...state,
      quote,
    ]..sort((a, b) => a.compareTo(b));

    await _firebaseDb.addQuote(quote);

    await _refreshQuotes();
  }

  void updateQuote(Quote quote) {
    // update quote in list
    state = [
      for (final q in state)
        if (q.id == quote.id) quote else q,
    ]..sort((a, b) => a.compareTo(b));

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

  void refreshQuotes() {
    _refreshQuotes();
  }
}
