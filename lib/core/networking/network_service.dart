// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';

import 'package:payment/core/networking/dio_factory.dart';

abstract class NetworkService {
  Future<Response> get(String url);
  Future<Response> post(String url, dynamic body, Map<String, String>? headers);
}

class NetworkServiceImp extends NetworkService {
  final String baseUrl;
  late final Dio dio;

  NetworkServiceImp({required this.baseUrl}) {
    dio = DioFactory.getDio(baseUrl);
  }

  @override
  Future<Response> get(String url) async {
    return await dio.get(url);
  }

  @override
  Future<Response> post(
    String url,
    dynamic body,
    Map<String, String>? headers,
  ) async {
    return await dio.post(
      url,
      data: body,
      options: headers != null ? Options(headers: headers) : null,
    );
  }
}
