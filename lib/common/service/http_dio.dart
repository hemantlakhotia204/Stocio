import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stocio_app/common/models/s_response.dart';
import 'package:stocio_app/common/store/shared_preference_repo.dart';
import 'package:stocio_app/common/utils/common_utils.dart';
import 'package:stocio_app/main.dart';

class HttpDio {
  static const baseUrl = "https://stocio-backend-git-hemant-hemantlakhotia204.vercel.app";
  static const duration = Duration(milliseconds: 10000);

  Dio? _dio;

  HttpDio({String? url}) {
    _dio = Dio(BaseOptions(
        baseUrl: url ?? baseUrl,
        receiveTimeout: duration,
        connectTimeout: duration,
        sendTimeout: duration,
        followRedirects: false,
        validateStatus: (status) {
          if (status != null && status <= 400) {
            return true;
          }
          return false;
        }));

    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final internetStatus = await Utils.checkInternetStatus();
        if (internetStatus == ConnectionState.none) {
          return handler.reject(
              DioError(
                error: 'No Internet Connection',
                type: DioErrorType.connectionError,
                message: 'No Internet Connection',
                response: Response(
                  statusCode: 502,
                  requestOptions: options,
                ),
                requestOptions: options,
              ),
              true);
        } else {
          return handler.next(options); //continue
        }
      },
      onResponse: (response, handler) {
        return handler.next(response); //continue
      },
      onError: (DioError e, handler) async {
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout ||
            e.type == DioErrorType.sendTimeout) {
          return handler.next(DioError(requestOptions: e.requestOptions, message: "Connection timed out."));
        }

        var response = e.response;

        if (response != null) {
          var status = response.statusCode;

          navigatorKey.currentState!.pop();
          switch (status) {
            case 502:
              log("redirecting to offline page");
              if (navigatorKey.currentState != null) {
                navigatorKey.currentState!.pushNamedAndRemoveUntil("/offline", (route) => false);
              }
              break;

            case 401:
              var res = SResponse.fromJson(response.data ?? {});
              if (res.msg == "Email not verified.") {
                // navigatorKey.currentState!.pushNamed("/otp", arguments: RegisterModel.fromJson(res.data));
              } else {
                log("redirecting to login");
                SharedPrefRepo.remove('at');
                navigatorKey.currentState!.pushNamedAndRemoveUntil("/login", (route) => false);
              }
              return handler.next(DioError(type: e.type, requestOptions: e.requestOptions, message: res.msg));
            case 404:
              var res = SResponse.fromJson(response.data ?? {});
              log("redirecting to login 404");
              SharedPrefRepo.remove('at');
              navigatorKey.currentState!.pushNamedAndRemoveUntil("/login", (route) => false);
              return handler.next(DioError(type: e.type, requestOptions: e.requestOptions, message: res.msg));
          }
        }

        return handler.next(e);
      },
    ));
  }

  Dio get dio {
    return _dio!;
  }
}
