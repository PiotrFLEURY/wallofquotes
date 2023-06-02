import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/view/pages/quotes/widgets/widgets.dart';
import 'package:wallofquotes/view_model/providers.dart';

class QuoteList extends ConsumerWidget {
  const QuoteList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quotes = ref.watch(quotesProvider);
    return ListView.separated(
      itemCount: quotes.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => QuoteTile(quote: quotes[index]),
    );
  }
}
