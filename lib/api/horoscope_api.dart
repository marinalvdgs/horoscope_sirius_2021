import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:horoscope_sirius_2021/models/horo.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

Future<String> downloadData(String url) async {
    Dio dio = Dio();
    Response response = await dio.get(url);
    final myTransformer = Xml2Json();
    if (response.statusCode == 200) {
      myTransformer.parse(response.data);
      var json = myTransformer.toGData();
      return json;
    } else {
      return "";
    }
}

Map<String, Horo> parseSigns(String data) {
  Map<String, dynamic> temp = json.decode(data);
  Map<String, Horo> result = HashMap();
  for (String sign in signs) {
      var t = temp['horo'][sign];
      result[sign] = Horo.fromJson(t);
  }
  return result;

}