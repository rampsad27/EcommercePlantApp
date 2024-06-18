import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:plant_app/configs/constants/app_constants.dart';
import 'package:plant_app/configs/di/di.dart';

class DioHelper {
  DioHelper() {
    addInterceptor();
  }

  Dio dio = getIt.get<Dio>();

  void addInterceptor() {
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(LogInterceptor());
  }
}

class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST [${options.method}] ${options.uri} ${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] ${response.requestOptions.path} ${response.data}');
    super.onResponse(response, handler);
  }
}

class AuthInterceptor extends Interceptor {
  Dio dio = getIt.get<Dio>();
  String _refreshToken = "YOUR_REFRESH_TOKEN";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Api-Key'] = 'ec57d0f4f9084603aee20e64b9f7d4f0';
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Assuming the server returns a 401 with a 'code' field
      await refreshToken();
      try {
        handler.resolve(await dio.request<dynamic>(
          err.requestOptions.path,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        ));
      } on DioException catch (e) {
        handler.next(e);
      }
    } else {
      handler.next(err);
    }
  }

  Future<void> refreshToken() async {
    try {
      final response = await dio.post(
        AppConstants.refreshToken,
        data: {"refresh_token": _refreshToken},
      );

      if (response.statusCode == 200) {
        // Assuming the response contains a new access token in the 'access_token' field
        _refreshToken = response.data['access_token'];
      } else {
        throw Exception("Failed to refresh token");
      }
    } catch (e) {
      throw Exception("Error refreshing token: $e");
    }
  }
}
