import 'package:dio_trending_api/dio_trending_api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/bootstrap.dart';
import 'package:flutter_boilerplate/common/http/other_http.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final trendingApi = DioTrendingApi(dio: trendingHttp);

  bootstrap(trendingApi: trendingApi);
}
