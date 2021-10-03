import 'package:dio/dio.dart';
import 'dio_interceptor.dart';

Dio dioCommon() {
  BaseOptions _dioOpts = BaseOptions(
      contentType: "application/json",
      responseType: ResponseType.json,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
      baseUrl: '');

  final dio = Dio(_dioOpts);
  dio.interceptors
    ..add(LoggingInterceptor())
    ..add(AuthInterceptor());
  return dio;
}