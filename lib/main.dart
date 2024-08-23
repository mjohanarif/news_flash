import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flash/injection.dart';
import 'package:news_flash/module/news/news.dart';

import 'shared/shared.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();

  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(
      details.exceptionAsString(),
      error: details.exceptionAsString(),
      stackTrace: details.stack,
      name: 'ERROR',
    );
  };
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimension.init(context);
    return BlocProvider(
      create: (context) => locator<GetNewsHeadlineBloc>()
        ..add(const GetNewsHeadlineEvent.getNewsHeadline()),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
            elevation: 2,
          ),
        ),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
