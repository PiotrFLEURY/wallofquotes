import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/model/quote.dart';

class RandomQuoteNotifier extends StateNotifier<Quote?> {
  RandomQuoteNotifier(this.quotes) : super(null);

  final List<Quote> quotes;

  void fetchRandomQuote() {
    if (quotes.isEmpty) return;
    state = quotes[Random().nextInt(quotes.length)];
  }
}
