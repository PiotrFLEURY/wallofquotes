import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/view_model/notifiers/quotes_notifier.dart';
import 'package:wallofquotes/view_model/notifiers/random_quote_notifier.dart';

final quotesProvider = StateNotifierProvider<QuotesNotifier, List<Quote>>(
  (ref) => QuotesNotifier()..fetchQuotes(),
);

final randomQuoteProvider = StateNotifierProvider<RandomQuoteNotifier, Quote?>(
  (ref) => RandomQuoteNotifier(ref.watch(quotesProvider))..fetchRandomQuote(),
);
