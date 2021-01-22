import 'package:app_leia_mais/src/di/locator.dart';
import 'package:app_leia_mais/src/global/theme/app_theme.dart';
import 'package:app_leia_mais/src/modules/book_detail/book_detail_view.dart';
import 'package:app_leia_mais/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'src/modules/home/home_view.dart';

void main() {
  setup();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: Routes.INITIAL,
      routes: {
        '': (_) => HomeView(),
        Routes.BOOK_DETAIL: (_) => BookDetailView(),
      },
      home: HomeView(),
    );
  }
}
