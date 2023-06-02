// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wallofquotes/data_sources/firebase_db.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/view_model/notifiers/quotes_notifier.dart';

import 'quote_notifier_test.mocks.dart';

@GenerateMocks([FirebaseDb])
void main() {
  late MockFirebaseDb firebaseDb;
  late QuotesNotifier notifier;

  setUp(() {
    firebaseDb = MockFirebaseDb();
    notifier = QuotesNotifier(firebaseDb);
  });

  test('fetchQuotes sets state to fresh quotes', () async {
    final freshQuotes = [
      Quote(text: 'Quote 1', author: 'Author 1'),
      Quote(text: 'Quote 2', author: 'Author 2'),
      Quote(text: 'Quote 3', author: 'Author 3'),
    ];
    when(firebaseDb.fetchQuotes()).thenAnswer((_) async => freshQuotes);

    await notifier.fetchQuotes();

    expect(
      notifier.state,
      isA<List<Quote>>()
          .having((list) => list.length, 'length', freshQuotes.length),
    );
  });

  test('fetchQuotes does not set state if state is not empty', () async {
    notifier.state = [
      Quote(text: 'Quote 1', author: 'Author 1'),
    ];

    await notifier.fetchQuotes();

    verifyNever(firebaseDb.fetchQuotes());
  });

  test('addQuote adds quote to state and Firebase', () async {
    final quote = Quote(text: 'Quote 1', author: 'Author 1');
    final quotes = [
      Quote(text: 'Quote 1', author: 'Author 1'),
      Quote(text: 'Quote 2', author: 'Author 2'),
      Quote(text: 'Quote 3', author: 'Author 3'),
    ];

    when(firebaseDb.fetchQuotes()).thenAnswer((_) async => quotes);
    // add new quote to the list when adding to Firebase
    when(firebaseDb.addQuote(quote)).thenAnswer((_) async {
      quotes.add(quote);
    });

    await notifier.addQuote(quote);

    verify(firebaseDb.addQuote(quote)).called(1);
    // expect 4 elements in the list
    expect(
      notifier.state,
      isA<List<Quote>>().having((list) => list.length, 'length', 4),
    );
    // expect quote to be in the list
    expect(notifier.state, contains(quote));
  });

  test('updateQuote updates quote in state and Firebase', () async {
    final quote1 = Quote(id: 1, text: 'Quote 1', author: 'Author 1');
    final quote2 = Quote(id: 2, text: 'Quote 2', author: 'Author 2');
    notifier.state = [quote1, quote2];

    final updatedQuote =
        Quote(id: 1, text: 'Updated Quote', author: 'Author 1');
    await notifier.updateQuote(updatedQuote);

    verify(firebaseDb.updateQuote(updatedQuote)).called(1);
    expect(true, notifier.state.contains(updatedQuote));
    expect(true, notifier.state.contains(quote2));
    expect(2, notifier.state.length);
  });

  // fireQuote
  test('fireQuote updates hotness of quote in state and Firebase', () async {
    final quote = Quote(id: 1, text: 'Quote 1', author: 'Author 1');
    notifier.state = [quote];

    await notifier.fireQuote(quote);

    verify(firebaseDb.updateQuote(quote.copyWith(hotness: 1))).called(1);
    expect(true, notifier.state.contains(quote.copyWith(hotness: 1)));
  });

  // likeQUote
  test('likeQuote updates hotness of quote in state and Firebase', () async {
    final quote = Quote(id: 1, text: 'Quote 1', author: 'Author 1');
    notifier.state = [quote];

    await notifier.likeQuote(quote);

    verify(firebaseDb.updateQuote(quote.copyWith(likes: 1))).called(1);
    expect(true, notifier.state.contains(quote.copyWith(likes: 1)));
  });

  // dislikeQuote
  test('dislikeQuote updates hotness of quote in state and Firebase', () async {
    final quote = Quote(id: 1, text: 'Quote 1', author: 'Author 1');
    notifier.state = [quote];

    await notifier.dislikeQuote(quote);

    verify(firebaseDb.updateQuote(quote.copyWith(dislikes: 1))).called(1);
    expect(true, notifier.state.contains(quote.copyWith(dislikes: 1)));
  });

  // reportQuote
  test('reportQuote updates hotness of quote in state and Firebase', () async {
    final quote = Quote(id: 1, text: 'Quote 1', author: 'Author 1');
    notifier.state = [quote];

    await notifier.reportQuote(quote);

    verify(firebaseDb.updateQuote(quote.copyWith(reports: 1))).called(1);
    expect(true, notifier.state.contains(quote.copyWith(reports: 1)));
  });
}
