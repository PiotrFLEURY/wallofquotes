import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wallofquotes/model/quote.dart';
import 'package:wallofquotes/view/pages/quotes/widgets/widgets.dart';
import 'package:wallofquotes/view/style/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallofquotes/view_model/providers.dart';

class QuotePage extends ConsumerStatefulWidget {
  const QuotePage({super.key});

  @override
  ConsumerState<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends ConsumerState<QuotePage> {
  Offset _dragOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    final randomQuote = ref.watch(randomQuoteProvider) ?? Quote.empty;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addQuote,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: mainColor,
        child: Container(
          height: 96,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                secondaryColor.withAlpha(100),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: ActionBar(
            fireCount: randomQuote.hotness,
            likeCount: randomQuote.likes,
            dislikeCount: randomQuote.dislikes,
            reportCount: randomQuote.reports,
            onFirePressed: () => _fireQuote(randomQuote),
            onLikePressed: () => _likeQuote(randomQuote),
            onDislikePressed: () => _dislikeQuote(randomQuote),
            onReportPressed: () => _reportQuote(randomQuote),
          ),
        ),
      ),
      backgroundColor: mainColor,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            _dragOffset = Offset(
              0,
              _dragOffset.dy + details.delta.dy,
            );
          });
        },
        onVerticalDragEnd: (details) {
          setState(() {
            _dragOffset = Offset.zero;
          });
          ref.read(quotesProvider.notifier).fetchQuotes();
        },
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.scale(
                scale: _dragOffset.dy * -0.001 + 1.0,
                child: const Padding(
                  padding: EdgeInsets.only(top: 48.0),
                  child: SwipeNotice(),
                ),
              ),
              Transform.translate(
                offset: _dragOffset,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Text(
                    randomQuote.text.isEmpty ? 'Loading...' : randomQuote.text,
                    style: GoogleFonts.oswald(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  void _addQuote() {
    context.go('/add');
  }

  void _fireQuote(Quote quote) {
    ref.read(quotesProvider.notifier).fireQuote(quote);
  }

  void _likeQuote(Quote quote) {
    ref.read(quotesProvider.notifier).likeQuote(quote);
  }

  void _dislikeQuote(Quote quote) {
    ref.read(quotesProvider.notifier).dislikeQuote(quote);
  }

  void _reportQuote(Quote quote) {
    ref.read(quotesProvider.notifier).reportQuote(quote);
  }
}
