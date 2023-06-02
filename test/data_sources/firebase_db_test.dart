import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/data_sources/firebase_db.dart';

void main() {
  group('FirebaseDb', () {
    late FirebaseFirestore firestore;
    late FirebaseDb firebaseDb;

    setUp(() {
      firestore = FakeFirebaseFirestore();
      firebaseDb = FirebaseDb(firestore);
    });

    test('fetchQuotes returns a list of quotes', () async {
      // Arrange
      final expectedQuotes = [
        Quote(
          id: 1,
          text: 'Be the change you wish to see in the world',
          author: 'Mahatma Gandhi',
        ),
        Quote(
          id: 2,
          text:
              'In three words I can sum up everything I\'ve learned about life: it goes on.',
          author: 'Robert Frost',
        ),
      ];
      await firestore
          .collection('quotes')
          .doc('1')
          .set(expectedQuotes[0].toJson());
      await firestore
          .collection('quotes')
          .doc('2')
          .set(expectedQuotes[1].toJson());

      // Act
      final actualQuotes = await firebaseDb.fetchQuotes();

      // Assert
      expect(actualQuotes, expectedQuotes);
    });

    test('addQuote adds a quote to the database', () async {
      // Arrange
      final quote = Quote(
        text: 'The best way to predict the future is to invent it.',
        author: 'Alan Kay',
      );

      // Act
      await firebaseDb.addQuote(quote);
      final dataset = await firestore.collection('quotes').get();
      final actualQuote = Quote.fromJson(dataset.docs.last.data());

      // Assert
      expect(actualQuote.text, quote.text);
      expect(actualQuote.author, quote.author);
    });

    test('updateQuote updates a quote in the database', () async {
      // Arrange
      final quote = Quote(
        id: 1,
        text: 'Be the change you wish to see in the world',
        author: 'Mahatma Gandhi',
      );
      await firestore.collection('quotes').doc('1').set(quote.toJson());
      final updatedQuote = Quote(
        id: 1,
        text: 'You must be the change you wish to see in the world',
        author: 'Mahatma Gandhi',
      );

      // Act
      await firebaseDb.updateQuote(updatedQuote);
      final dataset = await firestore.collection('quotes').get();
      final actualQuote = Quote.fromJson(dataset.docs.first.data());

      // Assert
      expect(actualQuote.text, updatedQuote.text);
      expect(actualQuote.author, updatedQuote.author);
    });
  });
}
