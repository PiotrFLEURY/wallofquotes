import 'package:flutter_test/flutter_test.dart';
import 'package:wallofquotes/model/quote.dart';

void main() {
  group('Quote', () {
    test('formattedText should replace the first letter with upper case', () {
      // Arrange
      final quote = Quote(text: 'hello world', author: 'me');

      // Act
      final formattedText = quote.formattedText;

      // Assert
      expect(formattedText, 'Hello world');
    });

    test('toJson returns a JSON map with the correct values', () {
      // Arrange
      final quote = Quote(id: 1, text: 'hello world', author: 'me');

      // Act
      final json = quote.toJson();

      // Assert
      expect(json['id'], 1);
      expect(json['text'], 'hello world');
      expect(json['author'], 'me');
    });

    test('fromJson returns a Quote object with the correct values', () {
      // Arrange
      final json = {'id': 1, 'text': 'hello world', 'author': 'me'};

      // Act
      final quote = Quote.fromJson(json);

      // Assert
      expect(quote.id, 1);
      expect(quote.text, 'hello world');
      expect(quote.author, 'me');
    });

    test('copyWith returns a new Quote object with the updated values', () {
      // Arrange
      final quote = Quote(id: 1, text: 'hello world', author: 'me');
      final updatedQuote = quote.copyWith(text: 'goodbye world');

      // Act
      final json = updatedQuote.toJson();

      // Assert
      expect(json['id'], 1);
      expect(json['text'], 'goodbye world');
      expect(json['author'], 'me');
    });

    test(
        'compareTo returns a negative value if this quote is less than the other quote',
        () {
      // Arrange
      final quote1 = Quote(id: 1, text: 'aaa', author: 'me');
      final quote2 = Quote(id: 2, text: 'bbb', author: 'you');

      // Act
      final result = quote1.compareTo(quote2);

      // Assert
      expect(result, lessThan(0));
    });

    test(
        'compareTo returns a positive value if this quote is greater than the other quote',
        () {
      // Arrange
      final quote1 = Quote(id: 2, text: 'bbb', author: 'you');
      final quote2 = Quote(id: 1, text: 'aaa', author: 'me');

      // Act
      final result = quote1.compareTo(quote2);

      // Assert
      expect(result, greaterThan(0));
    });

    test('compareTo returns zero if this quote is equal to the other quote',
        () {
      // Arrange
      final quote1 = Quote(id: 1, text: 'aaa', author: 'me');
      final quote2 = Quote(id: 1, text: 'aaa', author: 'me');

      // Act
      final result = quote1.compareTo(quote2);

      // Assert
      expect(result, 0);
    });

    test('compareTo considers all fields when comparing quotes', () {
      // Arrange
      final quote1 = Quote(id: 1, text: 'aaa', author: 'me');
      final quote2 = Quote(id: 1, text: 'aaa', author: 'you');
      final quote3 = Quote(id: 1, text: 'bbb', author: 'me');
      final quote4 = Quote(id: 2, text: 'aaa', author: 'me');

      // Act
      final result1 = quote1.compareTo(quote2);
      final result2 = quote1.compareTo(quote3);
      final result3 = quote1.compareTo(quote4);

      // Assert
      expect(result1, lessThan(0));
      expect(result2, lessThan(0));
      expect(result3, lessThan(0));
    });

    test('equals returns true if this quote is equal to the other quote', () {
      // Arrange
      final quote1 = Quote(id: 1, text: 'aaa', author: 'me');
      final quote2 = Quote(id: 1, text: 'aaa', author: 'me');

      // Act
      final result = quote1 == quote2;

      // Assert
      expect(result, isTrue);
    });

    test('equals returns false if this quote is not equal to the other quote',
        () {
      // Arrange
      final quote1 = Quote(id: 1, text: 'aaa', author: 'me');
      final quote2 = Quote(id: 2, text: 'bbb', author: 'you');

      // Act
      final result = quote1 == quote2;

      // Assert
      expect(result, isFalse);
    });

    test('hashCode returns the same value for equal quotes', () {
      // Arrange
      final quote1 = Quote(id: 1, text: 'aaa', author: 'me');
      final quote2 = Quote(id: 1, text: 'aaa', author: 'me');

      // Act
      final hashCode1 = quote1.hashCode;
      final hashCode2 = quote2.hashCode;

      // Assert
      expect(hashCode1, hashCode2);
    });

    test('hashCode returns different values for different quotes', () {
      // Arrange
      final quote1 = Quote(id: 1, text: 'aaa', author: 'me');
      final quote2 = Quote(id: 2, text: 'bbb', author: 'you');

      // Act
      final hashCode1 = quote1.hashCode;
      final hashCode2 = quote2.hashCode;

      // Assert
      expect(hashCode1, isNot(hashCode2));
    });
  });
}
