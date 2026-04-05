import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  static const String _baseUrl = 'https://dummyjson.com';

  ApiService(this._dio) {
    _dio.options = BaseOptions(baseUrl: _baseUrl);
  }

  Future<dynamic> get({required String endPoint}) async {
    final response = await _dio.get(endPoint);
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    final response = await _dio.post(endPoint, data: body);
    return response.data;
  }
}