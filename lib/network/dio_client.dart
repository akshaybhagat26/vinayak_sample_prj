import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinayak_expense_manager/network/api_service.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options
      ..baseUrl = ApiService.currencyAPIUrl
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 20)
      ..headers = {'Content-Type': 'json/application'};
  }

  Future<Response> get(String url) async {
    try {
      return await _dio.get(url);
    } catch (e) {
      rethrow;
    }
  }
}

final dioProvider = Provider<DioClient>((ref) => DioClient());
