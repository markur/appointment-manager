import 'package:dio/dio.dart';

// Base URL of your Rust backend
// const String _baseUrl = "http://localhost:3000/api/v1"; // For local development
// const String _baseUrl = "https://your-production-api.com/api/v1"; // For production

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    // connectTimeout: Duration(seconds: 5),
    // receiveTimeout: Duration(seconds: 3),
    // TODO: Configure baseUrl from environment or constants
    baseUrl: "http://127.0.0.1:3000/api/v1", // Placeholder, ensure this matches your Rust backend
  ));

  // Optional: Add interceptors for logging, auth tokens, etc.
  // dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  // dio.interceptors.add(InterceptorsWrapper(
  //   onRequest: (options, handler) {
  //     // Add auth token if available
  //     // final token = ref.read(authTokenProvider);
  //     // if (token != null) {
  //     //   options.headers['Authorization'] = 'Bearer $token';
  //     // }
  //     return handler.next(options);
  //   },
  // ));
  return dio;
});

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  // Example GET request
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      // Handle Dio specific errors
      // print("DioError: $e");
      rethrow;
    }
  }

  // Example POST request
  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      rethrow;
    }
  }
  // Add other methods like PUT, DELETE as needed
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.watch(dioProvider));
});
