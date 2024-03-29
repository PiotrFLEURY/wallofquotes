import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/view_model/providers.dart';

class AddQuotePage extends ConsumerStatefulWidget {
  const AddQuotePage({super.key});

  @override
  ConsumerState<AddQuotePage> createState() => _AddQuotePageState();
}

class _AddQuotePageState extends ConsumerState<AddQuotePage> {
  final TextEditingController _quoteController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _contextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            const Text(
              'Ajouter une citation',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Semantics(
              label: 'Quote text',
              child: TextField(
                controller: _quoteController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Citation',
                ),
                maxLines: 3,
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 24),
            Semantics(
              label: 'Quote author',
              child: TextField(
                controller: _authorController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Auteur',
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 24),
            Semantics(
              label: 'Quote context',
              child: TextField(
                controller: _contextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contexte',
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
            const SizedBox(height: 24),
            Semantics(
              label: 'Add quote button',
              child: ElevatedButton(
                onPressed: _addQuote,
                child: const Text('Ajouter'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addQuote() {
    // hide keyboard
    FocusScope.of(context).unfocus();
    // send quote
    _sendQuote();
    final analytics = ref.read(analyticsServiceProvider);
    analytics.logSaveQuote();
  }

  void _sendQuote() {
    final text = _quoteController.text;
    final author = _authorController.text;
    final quoteContext = _contextController.text;
    if (text.isNotEmpty && author.isNotEmpty) {
      // send quote to API
      debugPrint('quote: $text, author: $author');
      final quote = Quote(
        author: author,
        text: text,
        context: quoteContext,
      );
      ref
          .read(quotesProvider.notifier)
          .addQuote(quote)
          .then((value) => context.pop());
    } else {
      // show error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text('Veuillez remplir tous les champs'),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
