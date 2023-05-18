import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/view/app/router.dart';
import 'package:wallofquotes/view/style/theme.dart';

class WallOfQuotes extends StatelessWidget {
  const WallOfQuotes({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Wall of Quotes',
        theme: appTheme,
        routerConfig: routerBuilder(observer),
      ),
    );
  }
}
