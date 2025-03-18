import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Widgets Gallery App',

      /// NOTE: This helps to show a title in the Dialog for the Licenses on our software. See, SnackbarScreen implementation.
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 3).getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
