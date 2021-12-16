import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:horoscope_sirius_2021/api/balaboba_api.dart';
import 'package:horoscope_sirius_2021/dao/horo_dao_impl.dart';
import 'package:horoscope_sirius_2021/models/sign.dart';
import 'package:horoscope_sirius_2021/models/user.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final balabobaService = RM.inject<BalabobaService>(
      () => BalabobaService(),
);

class BalabobaService {

  BalabobaApi? api;

  Future<void> init() async {
    var options = BaseOptions(
        baseUrl: 'https://zeapi.yandex.net/lab/api/yalm'
    );
    api = BalabobaApi(dio: Dio(options));
    balabobaService.notify();
  }

  Future<String> getBalaboba(String str) async {
    String firstPart = await api!.getBalaboba(str);
    String secondPart = await api!.getBalaboba(str);
    return firstPart + "\n\n" + secondPart;
  }
}
