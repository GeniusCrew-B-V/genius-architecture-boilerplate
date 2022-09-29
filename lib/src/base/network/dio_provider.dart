import 'package:dio/dio.dart';

import '../../../resources/app_config.dart';

Dio provideDio({
  AppConfig? appConfig,
  List<Interceptor>? interceptors,
}) {
  BaseOptions options = new BaseOptions(
    baseUrl: "${appConfig?.host}",
    headers: {
      'accept': Headers.jsonContentType,
    },
    contentType: Headers.jsonContentType,
    connectTimeout: 130000,
    receiveTimeout: 130000,
  );
  var dio = Dio(options);
  if (interceptors != null) {
    for (var interceptor in interceptors) {
      dio.interceptors.add(interceptor);
    }
  }
  return dio;
}
