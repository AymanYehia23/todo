import 'package:dio/dio.dart';

import '../../core/strings.dart';

class HttpService {
  static late Dio _dio;

  static init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: Strings.baseUrl,
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
      ),
    );
  }

  static Future<Response> getRequest({
    required String endPoint,
  }) async {
    return await _dio.get(
      endPoint,
    );
  }

  static Future<Response> postRequest({
    required String endPoint,
    required Map<String, dynamic>? data,
  }) async {
    return await _dio.post(
      endPoint,
      data: data,
    );
  }

  static Future<Response> putRequest({
    required String endPoint,
    required Map<String, dynamic>? data,
  }) async {
    return await _dio.put(
      endPoint,
      data: data,
    );
  }

  static Future<Response> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    return await _dio.delete(
      endPoint,
      data: data,
    );
  }
}
