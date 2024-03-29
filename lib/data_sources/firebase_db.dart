import 'package:wallofquotes/model/quote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDb {
  const FirebaseDb(this.firestore);

  final FirebaseFirestore firestore;

  Future<List<Quote>> fetchQuotes() async {
    final dataset = await firestore
        .collection('quotes')
        .where(
          'dislikes',
          isNotEqualTo: 999,
        )
        .get();

    // convert to list of quotes
    return dataset.docs.map((doc) => Quote.fromJson(doc.data())).toList()
      ..sort(
        (a, b) => a.compareTo(b),
      );
  }

  // add a quote
  Future<void> addQuote(Quote quote) async {
    // get the next id
    final dataset = await firestore.collection('quotes').get();
    final nextId = dataset.docs.length + 1;

    // set the id
    quote.id = nextId;

    await firestore
        .collection('quotes')
        .doc(quote.id.toString())
        .set(quote.toJson());
  }

  // update a quote
  Future<void> updateQuote(Quote quote) async {
    await firestore
        .collection('quotes')
        .doc(quote.id.toString())
        .update(quote.toJson());
  }
}
