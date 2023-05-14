import 'package:go_router/go_router.dart';
import 'package:wallofquotes/view/pages/add/add_quote_page.dart';
import 'package:wallofquotes/view/pages/quotes/quote_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const QuotePage(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const AddQuotePage(),
        ),
      ],
    ),
  ],
);
