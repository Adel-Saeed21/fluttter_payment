import 'package:dio/dio.dart';
import 'package:payment/core/networking/dio_factory.dart';

abstract class NetworkService {
  Future<Response> get(String url);
  Future<Response> post(
    String url,
    dynamic body,
    Map<String, String>? headers,
  );
}

class NetworkServiceImp extends NetworkService {
  final dio = DioFactory.getDio();

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
      options: Options(headers: headers),
    );
  }
}
