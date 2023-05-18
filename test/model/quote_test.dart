import 'package:flutter_test/flutter_test.dart';
import 'package:wallofquotes/model/quote.dart';

main() {
  test('formattedText should replace the first letter with upper case', () {
    final quote = Quote(text: 'hello world', author: 'me');
    expect(quote.formattedText, 'Hello world');
  });
}
