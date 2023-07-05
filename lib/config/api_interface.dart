import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_flutter_developer/config/app_client.dart';

class ApiInterface {
  late Dio api;
  static final ApiInterface _instance = ApiInterface._privateConstructor();
  factory ApiInterface() => _instance;

  static ApiInterface get instance => _instance;
  ApiInterface._privateConstructor() {
    BaseOptions options = BaseOptions(
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      baseUrl: AppClient.baseUrl,
    );
    api = Dio(options);
    api.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers.addAll({"Authorization": "Bearer ${AppClient.bearerToken}"});
          // }
          handler.next(options);
        },
        onError: (e, handler) => _onError(e, handler),
        onResponse: (e, handler) {
          api.options.queryParameters.clear();
          return handler.next(e);
        },
      ),
    );
  }

  //FUNCTION ON ERROR INTERFACE
  Future<dynamic> _onError(DioException e, ErrorInterceptorHandler handler) async {
    Response? response = e.response;
    api.options.queryParameters.clear();
    if (response?.statusCode == HttpStatus.unauthorized || response?.statusCode == HttpStatus.forbidden) {
      try {
        handler.next(e);
      } catch (e) {
        log("error internet");
      }
    }
    try {
      handler.next(e);
    } catch (e) {
      log("error internet");
    }
  }
}
