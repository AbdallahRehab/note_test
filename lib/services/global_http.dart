import 'dart:convert';
import 'dart:developer' as log;
import 'dart:io';
import 'dart:math';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/ConnectionStatus.dart';
import '../utils/ToastM.dart';


class GlobalHttpResponse {
  int? statusCode;
  String? body;

  GlobalHttpResponse({this.statusCode, this.body});
}

// General Http API
class GlobalHttp {
  // POST
  static Future<GlobalHttpResponse> post(url,
      {body, contentTypeHeader, bool isAuthorizationHeader = false,bool showMessage = false,bool isShowNotification = false}) async {
    var dio = Dio();
    int notificationId = Random().nextInt(999);

    // bad request adapter
    dioBadRequestAdapter(dio);

    Response? response;

      try {

        response = await dio.post<String>(
          Uri.encodeFull(url),
          data: body,
        );
      } catch (e) {
        print("Response Of Post :: " + e.toString());
      }

      String responseBody = response!.data;

      if (showMessage && response.statusCode != 200) {
        ToastM.show(json.decode(responseBody)['message']);
      }

      print("Response Of Post :: $url " + responseBody);


      return GlobalHttpResponse(
          statusCode: response.statusCode, body: responseBody);


  }

  // GET
  static Future<GlobalHttpResponse> get(url,
      {contentTypeHeader, bool isAuthorizationHeader = false}) async {
    var dio = Dio();
    Response? response;


      try {
        // bad request adapter
        dioBadRequestAdapter(dio);


        response = await dio.get<String>(
          Uri.encodeFull(url),
        );
        print("Response Of Get :: " + response.statusCode.toString());
      } catch (e) {}

      String responseBody = response!.data;
      print("Response Of Get :: " + responseBody);


      return GlobalHttpResponse(
          statusCode: response.statusCode, body: responseBody);

  }

  // Adapter
  static void dioBadRequestAdapter(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => false;
      return client;
    };
    dio.interceptors.add(CustomInterceptors());
  }

}
class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.log('REQUEST:: ${options.uri} and Body::${options.data}');
    log.log('Header:: ${options.headers}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.log('RESPONSE:: Status code is: ${response.statusCode} response is: ${jsonDecode(response.data)}');

    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log.log('ERROR::$err');
    return handler.next(err);
  }
}