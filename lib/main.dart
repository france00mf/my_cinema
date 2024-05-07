import 'package:flutter/material.dart';
import 'package:my_cinema/core/resources/app_router.dart';
import 'package:my_cinema/core/resources/app_strings.dart';
import 'package:my_cinema/core/resources/app_theme.dart';
import 'package:my_cinema/core/services/service_locator.dart';


void main() async {
  ServiceLocator.init();
  runApp(
   MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: getApplicationTheme(),
      routerConfig: AppRouter().router,
    );
  }
}
