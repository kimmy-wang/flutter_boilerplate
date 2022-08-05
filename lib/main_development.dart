import 'package:dio_trending_api/dio_trending_api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/bootstrap.dart';
import 'package:flutter_boilerplate/common/http/other_http.dart';
import 'package:local_storage_todos_api/local_storage_todos_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final todosApi = LocalStorageTodosApi(
    plugin: await SharedPreferences.getInstance(),
  );

  final trendingApi = DioTrendingApi(dio: trendingHttp);

  bootstrap(todosApi: todosApi, trendingApi: trendingApi);
}
