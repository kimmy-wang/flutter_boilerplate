import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/common/constants/constants.dart';

class BaseInterceptor extends InterceptorsWrapper {
  final String baseUrl;

  BaseInterceptor(this.baseUrl);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options
      ..baseUrl = baseUrl
      ..connectTimeout = Constants.timeOut * 1000 //5s
      ..receiveTimeout = Constants.timeOut * 1000
      ..headers.addAll(Constants.headers);
    super.onRequest(options, handler);
  }
}
