import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:spacex_app/constants/api_constants.dart';
import 'package:spacex_app/utils/app_exceptions.dart';

class ApiClient {
  Dio _dio;

  ApiClient(Dio dio) {
    dio.interceptors
        .add(InterceptorsWrapper(onError: (DioError error) => error));
    _dio = dio;
  }

  Future<T> httpGet<T>(
      String serviceName) async {
    var responseJson;
    try {
      final response = await _dio.get(ApiConstants.baseUrl + serviceName);
      print(response);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson as T;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.data.toString());
      default:
        throw FetchDataException(
            'Something went wrong : ${response.statusCode}');
    }
  }
}
