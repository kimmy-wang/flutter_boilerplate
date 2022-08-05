import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio_trending_api/dio_trending_api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/app/app_bloc_observer.dart';
import 'package:todos_api/todos_api.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:trending_repository/trending_repository.dart';

void bootstrap(
    {required TodosApi todosApi, required DioTrendingApi trendingApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final todosRepository = TodosRepository(todosApi: todosApi);
  final trendingRepository = TrendingRepository(trendingApi: trendingApi);

  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          App(
            todosRepository: todosRepository,
            trendingRepository: trendingRepository,
          ),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
