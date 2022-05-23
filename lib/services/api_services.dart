import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  final box = GetStorage();

  Dio launch() {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 1000));

    dio.options.headers["accept"] = 'application/json';
    dio.options.followRedirects = false;
    dio.options.validateStatus = (s) {
      return s! < 500;
    };

    return dio;
  }
}
