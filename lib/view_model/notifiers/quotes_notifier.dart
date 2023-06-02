import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/data_sources/firebase_db.dart';
import 'package:wallofquotes/model/quote.dart';

class QuotesNotifier extends StateNotifier<List<Quote>> {
  QuotesNotifier(this._firebaseDb) : super([]);

  final FirebaseDb _firebaseDb;

  Future<void> fetchQuotes() async {
    if (state.isNotEmpty) return;
    await _refreshQuotes();
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

  Future<void> updateQuote(Quote quote) async {
    // update quote in list
    state = [
      for (final q in state)
        if (q.id == quote.id) quote else q,
    ]..sort((a, b) => a.compareTo(b));

    await _firebaseDb.updateQuote(quote);
  }

  Future<void> fireQuote(Quote quote) async {
    await updateQuote(quote.copyWith(hotness: quote.hotness + 1));
  }

  Future<void> likeQuote(Quote quote) async {
    await updateQuote(quote.copyWith(likes: quote.likes + 1));
  }

  Future<void> dislikeQuote(Quote quote) async {
    await updateQuote(quote.copyWith(dislikes: quote.dislikes + 1));
  }

  Future<void> reportQuote(Quote quote) async {
    await updateQuote(quote.copyWith(reports: quote.reports + 1));
  }

  Future<void> refreshQuotes() async {
    await _refreshQuotes();
  }
}
