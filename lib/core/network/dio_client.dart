
import 'package:dio/dio.dart';

Dio buildDioClint(String baseUrl) {
  final dio = Dio()..options = BaseOptions(baseUrl: baseUrl);

  dio.interceptors.addAll([

  ]);

  return dio;
}