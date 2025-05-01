import 'package:dio/dio.dart';

class DioConnection {
  static DioConnection? _instance;
  late final Dio _dio;

  factory DioConnection() {
    _instance ??= DioConnection._internal();
    return _instance!;
  }

  DioConnection._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl:
            "https://fooddelivery.digital-vision-solutions.com/api/",
        // connectTimeout: const Duration(seconds: 10),
        // receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }






  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.get(
        endpoint,
        data: data == null ? null : FormData.fromMap(data),
      );

      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }



  Future<Map<String, dynamic>> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data == null ? null : FormData.fromMap(data),
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> put(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return _handleResponse(response.data);
    } catch (e) {
      throw Exception(_handleError(e));
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return _handleResponse(response.data);
    } catch (e) {
      throw Exception(_handleError(e));
    }
  }

  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      return data;
    } else {
      throw Exception("Unexpected error: ${response.data["errors"]}");
    }
  }

  String _handleError(dynamic error) {
    if (error is DioException) {
      final errors = error.response!.data["errors"] as Map<String, dynamic>;
      final List<String> messages = [];

      for (var entry in errors.entries) {
        for (var message in entry.value) {
          messages.add(message);
        }
      }
      return messages.join('\n\n ');
    } else {
      return 'Unknown error occurred';
    }
  }
}
