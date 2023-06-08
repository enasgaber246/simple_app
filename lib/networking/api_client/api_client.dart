import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class APIClient {
  Future<Map<String, dynamic>?> getHttp(String endPoint) async {
    // String token = (await SharedPrefs().getUserToken()) ?? '';
    String token = '';
    String currentLang = Get.locale?.languageCode ?? 'en';

    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['lang'] = currentLang;

    if (token.isNotEmpty) {
      dio.options.headers["authorization"] = "Bearer $token";
    }

    var response = await dio.get(
      'https://sample.com/api/$currentLang/$endPoint',
    );

    if (kDebugMode) {
      print('DioResponse endPoint :  $endPoint');
      print('DioResponse headers :  Bearer $token');

      print('DioResponse statusCode :  ${response.statusCode}');
      print('DioResponse isRedirect :  ${response.isRedirect}');
      print('DioResponse response :  ${response.data}');
    }

    return Map<String, dynamic>.from(response.data);
  }

  Future<Map<String, dynamic>?> postHttp(
    String endPoint,
    Map<String, dynamic> body, {
    Map<String, dynamic>? params,
    bool showToast = false,
  }) async {
    // String token = (await SharedPrefs().getUserToken()) ?? '';
    String token = '';
    String currentLang = Get.locale?.languageCode ?? 'en';

    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['lang'] = currentLang;

    if (token.isNotEmpty) {
      dio.options.headers["authorization"] = "Bearer $token";
    }

    try {
      var response = await dio.post(
        'https://sample.com/api/$currentLang/$endPoint',
        data: body,
        options: Options(
          receiveDataWhenStatusError: true,
        ),
        onSendProgress: (int sent, int total) {
          if (kDebugMode) {
            print('$sent $total');
          }
        },
      );

      return Map<String, dynamic>.from(response.data);
    } on DioError catch (ignored) {
      return Map<String, dynamic>.from(ignored.response!.data);
    }
  }
}
