import 'package:flutter_test/flutter_test.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/view/app/app.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:wallofquotes/view_model/providers.dart';

void main() {
  final fakeCloudFirestore = FakeFirebaseFirestore();
  fakeCloudFirestore.collection('quotes').add(
        Quote(
          text: 'hello world',
          author: 'me',
        ).toJson(),
      );

  testWidgets('App should load quote to the first page',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      WallOfQuotes(
        overrides: [
          fireStoreProvider.overrideWithValue(fakeCloudFirestore),
        ],
      ),
    );

    expect(find.text('Loading...'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Hello world'), findsOneWidget);
  });
}
