import 'dart:collection';
import 'package:dio/dio.dart';
import 'package:horoscope_sirius_2021/dao/horo_dao.dart';
import 'package:horoscope_sirius_2021/models/full_horo.dart';
import 'package:horoscope_sirius_2021/models/horo.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert';
import 'package:jiffy/jiffy.dart';

class HoroscopeApi {
  HoroDao dao;
  Dio dio;

  HoroscopeApi({
    required this.dao,
    required this.dio,
  });

  Future<String?> _downloadData(String url) async {
    Response response = await dio.request(url, options: Options(method: 'GET'));
    final transformer = Xml2Json();
    if (response.statusCode == 200) {
      transformer.parse(response.data);
      var json = transformer.toGData();
      return json;
    }
  }

  Map<String, Horo> _parseSigns(String data) {
    Map<String, dynamic> temp = json.decode(data);
    Map<String, Horo> result = HashMap();
    for (String sign in signs) {
      var t = temp['horo'][sign];
      t['sign'] = sign;
      t['date'] = Jiffy(temp['horo']['date']['today'], "dd.MM.yyyy").dateTime;
      result[sign] = Horo.fromJson(t);
    }
    return result;
  }

  Future<Map<String, Horo>?> _getHorosByUrl(url) async {
    return await _downloadData(url).then((result) {
      if (result != null) {
        return _parseSigns(result);
      } else {
        return null;
      }
    });
  }

  bool _needChange(DateTime dateTime) {
    int hours = DateTime.now().difference(dateTime).inHours;
    return hours > 24;
  }

  Future<void> init() async {
    var db = dao.getItem("libra");
    if (db == null || _needChange(db.love.date)) {
      await dao.clearAll();
      await _initHoro(dao);
    }
  }

  Future<List<FullHoro>?> _getHoros() async {
    var loveList = await _getHorosByUrl(horoApiMap['love']);
    var bisinessList = await _getHorosByUrl(horoApiMap['bisiness']);
    var commonList = await _getHorosByUrl(horoApiMap['common']);
    var healthList = await _getHorosByUrl(horoApiMap['health']);
    if (loveList == null || bisinessList == null || commonList == null || healthList == null) {
      return null;
    }
    List<FullHoro> result = List.empty(growable: true);
    for (String sign in signs) {
      result.add(FullHoro(
          sign: sign,
          love: loveList[sign]!,
          bisiness: bisinessList[sign]!,
          common: commonList[sign]!,
          health : healthList[sign]!),
      );
    }
    return result;
  }

  FullHoro? getHoroBySign(String sign) {
    // await _update('aries');
    return dao.getItem(sign);
  }

  Future<bool> _initHoro(HoroDao dao) async {
    List<FullHoro>? list = await _getHoros();
    if (list != null) {
      await dao.saveAll(list);
      return true;
    } else {
      return false;
    }
  }
}

Map<String, String> horoApiMap = {
  'love': '/ero.xml',
  'common': '/com.xml',
  'bisiness': '/bus.xml',
  'health': '/hea.xml',
};
