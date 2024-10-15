import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_builder_app/src/core/utils/logger_interceptor.dart';

part 'dio_provider.g.dart';

// TODO replace with your api url or create .env
const baseUrl = 'some-url';

@riverpod
Dio dio(DioRef ref) {
  final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
    headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
  ));
  dio.interceptors.add(LoggerInterceptor());
  return dio;
}
