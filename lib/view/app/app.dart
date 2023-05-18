import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallofquotes/view/app/router.dart';
import 'package:wallofquotes/view/style/theme.dart';

class WallOfQuotes extends StatelessWidget {
  const WallOfQuotes({
    super.key,
    this.navigatorObserver,
    this.overrides = const [],
  });

  final NavigatorObserver? navigatorObserver;
  final List<Override> overrides;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: overrides,
      child: MaterialApp.router(
        title: 'Wall of Quotes',
        theme: appTheme,
        routerConfig: routerBuilder(navigatorObserver),
      ),
    );
  }
}
