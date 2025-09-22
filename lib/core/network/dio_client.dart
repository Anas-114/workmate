// import 'dart:developer';

// import 'package:dio/dio.dart';

// class DioClient {
//   final Dio _dio;

//   DioClient({String? apiKey})
//       : _dio = Dio(
//           BaseOptions(
//             baseUrl: "https://reqres.in/api/",
//             connectTimeout: const Duration(seconds: 5),
//             receiveTimeout: const Duration(seconds: 5),
//             headers: {
//               "Content-Type": "application/json",
//               if (apiKey != null) "x-api-key": "reqres-free-v1",
//             },
//           ),
//         ) {
//     // Logging interceptor for debugging requests and responses
//     _dio.interceptors.add(LogInterceptor(
//       requestBody: true,
//       responseBody: true,
//       error: true,
//     ));
//   }

//   Dio get client => _dio;

//   // Optional: wrapper method for safe GET requests
//   Future<Response?> safeGet(String path) async {
//     try {
//       log("DioClient: Sending GET request → $path");
//       final response = await _dio.get(path);
//       log("DioClient: Response received → ${response.statusCode}");
//       return response;
//     } catch (e, stack) {
//       log("DioClient: GET request error → $e");
//       log("Stack trace: $stack");
//       return null;
//     }
//   }

//   // Optional: wrapper method for safe POST requests
//   Future<Response?> safePost(String path, dynamic data) async {
//     try {
//       log("DioClient: Sending POST request → $path with data: $data");
//       final response = await _dio.post(path, data: data);
//       log("DioClient: Response received → ${response.statusCode}");
//       return response;
//     } catch (e, stack) {
//       log("DioClient: POST request error → $e");
//       log("Stack trace: $stack");
//       return null;
//     }
//   }
// }


import 'dart:developer';
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
              if (apiKey != null) "x-api-key": apiKey, // Corrected syntax
            },
          ),
        ) {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  Dio get client => _dio;
}