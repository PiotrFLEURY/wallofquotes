import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/model/quote.dart';

class CurrentQuoteNotifier extends StateNotifier<({int index, Quote? quote})> {
  CurrentQuoteNotifier(this.quotes) : super((index: -1, quote: null));

  final List<Quote> quotes;

  void nextQuote() {
    if (quotes.isEmpty) return;
    // get quote after current index, return to 0 if at end
    final nextIndex = state.index + 1 < quotes.length ? state.index + 1 : 0;
    state = (index: nextIndex, quote: quotes[nextIndex]);
  }
}
