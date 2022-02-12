import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class BalabobaApi {
  final Dio dio;

  BalabobaApi({
    required this.dio,
  });

  Future<String> getBalaboba(String str) async {
    Response response = await dio.request(
      "/text3",
      options: Options(method: 'POST', headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode({
        "query": str, //"Булат"
        "intro": 10
      }),
    );
    if (response.statusCode == 200) {
      Map data = response.data;
      return data["text"];
    }
    return "";
  }

  Future<String> getManQuotes(String str) async {
    Response response = await dio.request(
      "/text3",
      options: Options(method: 'POST', headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode({
        "query": str, //"Булат"
        "intro": 4
      }),
    );
    if (response.statusCode == 200) {
      Map data = response.data;
      return data["text"];
    }
    return "";
  }
}
