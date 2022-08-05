import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/modules/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/theme/theme.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:trending_repository/trending_repository.dart';

import 'helpers/helpers.dart';

void main() {
  late TodosRepository todosRepository;
  late TrendingRepository trendingRepository;

  setUp(() {
    todosRepository = MockTodosRepository();
    when(
      () => todosRepository.getTodos(),
    ).thenAnswer((_) => const Stream.empty());

    trendingRepository = MockTrendingRepository();
    when(
      () => trendingRepository.getTrending(),
    ).thenAnswer((_) => Future.value([]));
  });

  group('App', () {
    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(
        App(
          todosRepository: todosRepository,
          trendingRepository: trendingRepository,
        ),
      );

      expect(find.byType(AppView), findsOneWidget);
    });
  });

  group('AppView', () {
    testWidgets('renders MaterialApp with correct themes', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: todosRepository,
          child: const AppView(),
        ),
      );

      expect(find.byType(MaterialApp), findsOneWidget);

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, equals(FlutterTodosTheme.light));
      expect(materialApp.darkTheme, equals(FlutterTodosTheme.dark));
    });

    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: todosRepository,
          child: const AppView(),
        ),
      );

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
