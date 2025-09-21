import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient({String? apiKey})
      : _dio = Dio(
          BaseOptions(
            baseUrl: "https://reqres.in/api/",
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            headers: {
              "Content-Type": "application/json",
              if (apiKey != null) "x-api-key": apiKey, // only add if provided
            },
          ),
        ) {
    // Optional: Logging interceptor for debugging
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  Dio get client => _dio;
}
