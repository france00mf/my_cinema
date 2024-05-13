import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_cinema/core/domain/entities/media.dart';
import 'package:my_cinema/core/resources/app_router.dart';
import 'package:my_cinema/core/resources/app_strings.dart';
import 'package:my_cinema/core/resources/app_theme.dart';
import 'package:my_cinema/core/services/service_locator.dart';
import 'package:my_cinema/move/presenter/controllers/movies_bloc/movies_bloc.dart';


void main() async {
   await Hive.initFlutter();
  Hive.registerAdapter(MediaAdapter());
  await Hive.openBox('items');
  ServiceLocator.init();
  runApp(
    BlocProvider(
      create: (context)=> sl<MoviesBloc>(),
      child: MyApp(),
    )
  
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
