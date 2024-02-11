import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/view/pages/quotes/widgets/widgets.dart';
import 'package:wallofquotes/view/style/colors.dart';

class QuotePage extends ConsumerStatefulWidget {
  const QuotePage({super.key});

  @override
  ConsumerState<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends ConsumerState<QuotePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.5),
          tabs: const [
            Tab(
              icon: Icon(
                Icons.format_quote,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.list,
              ),
            ),
          ],
        ),
        backgroundColor: mainColor,
        body: const TabBarView(
          children: [
            RandomQuote(),
            QuoteList(),
          ],
        ),
      ),
    );
  }
}
