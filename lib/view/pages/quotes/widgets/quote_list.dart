import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/view/pages/quotes/widgets/action_button.dart';
import 'package:wallofquotes/view_model/providers.dart';

class QuoteList extends ConsumerWidget {
  const QuoteList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quotes = ref.watch(quotesProvider);
    return ListView.separated(
      itemCount: quotes.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final quote = quotes[index];
        return ListTile(
          title: Text(
            quote.formattedText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActionButton(
                icon: Icons.local_fire_department_outlined,
                count: quote.hotness,
                color: Colors.grey,
              ),
              ActionButton(
                icon: Icons.favorite_border,
                count: quote.likes,
                color: Colors.grey,
              ),
              ActionButton(
                icon: Icons.thumb_down_alt_outlined,
                count: quote.dislikes,
                color: Colors.grey,
              ),
              ActionButton(
                icon: Icons.new_releases_outlined,
                count: quote.reports,
                color: Colors.grey,
              ),
            ],
          ),
        );
      },
    );
  }
}
