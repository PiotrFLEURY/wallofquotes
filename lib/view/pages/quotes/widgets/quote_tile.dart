import 'package:flutter/material.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/view/pages/quotes/widgets/widgets.dart';

class QuoteTile extends StatelessWidget {
  const QuoteTile({super.key, required this.quote});

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        quote.formattedText,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      subtitle: _QuoteTileActions(quote: quote),
    );
  }
}

class _QuoteTileActions extends StatelessWidget {
  const _QuoteTileActions({
    required this.quote,
  });

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
