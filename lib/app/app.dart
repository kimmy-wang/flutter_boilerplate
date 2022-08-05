import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/modules/home/home.dart';
import 'package:flutter_boilerplate/l10n/l10n.dart';
import 'package:flutter_boilerplate/theme/theme.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:trending_repository/trending_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.todosRepository,
    required this.trendingRepository,
  });

  final TodosRepository todosRepository;
  final TrendingRepository trendingRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: trendingRepository,
      child: RepositoryProvider.value(
        value: todosRepository,
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterTodosTheme.light,
      darkTheme: FlutterTodosTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
