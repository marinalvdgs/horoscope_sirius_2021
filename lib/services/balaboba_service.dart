import 'package:dio/dio.dart';
import 'package:horoscope_sirius_2021/api/balaboba_api.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final balabobaService = RM.inject<BalabobaService>(
  () => BalabobaService(),
);

class BalabobaService {
  BalabobaApi? api;

  Future<void> init() async {
    var options = BaseOptions(baseUrl: 'https://zeapi.yandex.net/lab/api/yalm');
    api = BalabobaApi(dio: Dio(options));
    balabobaService.notify();
  }

  Future<String> getBalaboba(String str) async {
    Future<String> firstPart = api!.getBalaboba(str);
    Future<String> secondPart = api!.getBalaboba(str);
    var futures = <Future>[];
    futures.add(firstPart);
    futures.add(secondPart);
    await Future.wait(futures);
    return (await firstPart) + "...\n\n" + (await secondPart) + "..";
  }
}
