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
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.format_quote)),
            Tab(icon: Icon(Icons.list)),
          ],
        ),
        backgroundColor: mainColor,
        body: TabBarView(
          children: [
            RandomQuote(),
            QuoteList(),
          ],
        ),
      ),
    );
  }
}
