import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/model/quote.dart';

class QuotesNotifier extends StateNotifier<List<Quote>> {
  QuotesNotifier() : super([]);

  void fetchQuotes() {
    // TODO: fetch from server
    state = [
      Quote(
        id: 1,
        author: 'Albert Einstein',
        text:
            'C\'est pas nous qui sommes en retard, ce sont les estimations qui sont fausses !',
      ),
      Quote(
        id: 2,
        text: 'Pour moi le partage c\'est récupérer',
        author: 'Azimov',
      ),
    ];
  }

  void addQuote(Quote quote) {
    state = [...state, quote];
  }

  void updateQuote(Quote quote) {
    // TODO: send to server
    state = [
      for (final q in state)
        if (q.id == quote.id) quote else q,
    ];
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
