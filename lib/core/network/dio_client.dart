import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient({required String apiKey})
      : _dio = Dio(
          BaseOptions(
            baseUrl: "https://reqres.in/api/", // ReqRes base URL
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            headers: {
              "Content-Type": "application/json",
              "x-api-key": "reqres-free-v1", // Add your API key here
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
