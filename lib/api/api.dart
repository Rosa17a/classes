import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:space_flights/api/articles.dart';
import 'package:space_flights/keys.dart';

class API {
  BehaviorSubject<bool> loadingStream = BehaviorSubject<bool>();

  void close() {
    loadingStream.close();
  }

  API._internal(this.articles) {
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      // print('REQUEST ======= $options');
      // showDialog(
      //     context: GlobalContext.context,
      //     builder: (context) => Text("Yani loading"));
      //
      loadingStream.sink.add(true);
      // print('Show loading');
      handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      // print("Resopne ---- Stop loading${response.data}");

      // Navigator.of(GlobalContext.context).pop();
      loadingStream.sink.add(false);
      handler.next(response);
    }, onError: (DioError dioError, ErrorInterceptorHandler handler) {
      // print("Error ---- Stop loading");
      loadingStream.sink.add(false);
      handler.next(dioError);
    }));
  }

  static Dio dio = Dio();
  final Articles articles;
  static API singlton = API._internal(Articles(dio));
  factory API() => singlton;
}
