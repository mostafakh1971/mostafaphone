import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: "https://api.techspecs.io/v4/", headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImN1c19QZTNzWnVET1ZzSlNqNCIsIm1vZXNpZlByaWNpbmdJZCI6InByaWNlXzFNUXF5dkJESWxQbVVQcE1NNWc2RmVvbyIsImlhdCI6MTcwOTEyMTM5N30.A2SWEue8fSGm1HUBZsgK9wLtrBfqgaUOSi2rsyc7GDQ"
    }));
  }

  static Future<Response?> get(
      {required String path, Map<String, dynamic>? query}) async {
    return await dio?.get(path, queryParameters: query);
  }

  static Future<Response?> post(
      {required String path,
      Map<String, dynamic>? query,
      required dynamic data}) async {
    return await dio?.post(path, queryParameters: query, data: data);
  }
}
