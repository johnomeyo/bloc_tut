import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://catfact.ninja';

  Future<Response> get(String path) async {
    try {
      final response = await _dio.get('$_baseUrl$path');
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.message}');
    }
  }
}