import 'package:flutter_test/flutter_test.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/view_model/notifiers/random_quote_notifier.dart';

void main() {
  group('RandomQuoteNotifier', () {
    test('fetchRandomQuote sets state to a random quote', () {
      final quotes = [
        Quote(text: 'Quote 1', author: 'Author 1'),
        Quote(text: 'Quote 2', author: 'Author 2'),
        Quote(text: 'Quote 3', author: 'Author 3'),
      ];
      final notifier = RandomQuoteNotifier(quotes);

      notifier.fetchRandomQuote();

      // ignore: invalid_use_of_protected_member
      expect(notifier.state, isNotNull);
      // ignore: invalid_use_of_protected_member
      expect(quotes.contains(notifier.state!), isTrue);
    });

    test('fetchRandomQuote does not set state if quotes is empty', () {
      final notifier = RandomQuoteNotifier([]);

      notifier.fetchRandomQuote();

      // ignore: invalid_use_of_protected_member
      expect(notifier.state, isNull);
    });
  });
}
