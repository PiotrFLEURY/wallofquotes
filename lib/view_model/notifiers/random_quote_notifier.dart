import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/model/quote.dart';

class RandomQuoteNotifier extends StateNotifier<Quote?> {
  RandomQuoteNotifier(this.quotes) : super(null);

  final List<Quote> quotes;
  final List<Quote> unseenQuotes = [];

  void fetchRandomQuote() {
    if (quotes.isEmpty) return;
    if (unseenQuotes.isEmpty) {
      unseenQuotes.addAll(quotes);
      unseenQuotes.sort((a, b) => b.compareTo(a));
    }
    final randomQuote = unseenQuotes[Random().nextInt(unseenQuotes.length)];
    unseenQuotes.remove(randomQuote);
    state = randomQuote;
  }
}
