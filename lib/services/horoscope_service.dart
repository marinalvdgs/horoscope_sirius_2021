import 'package:dio/dio.dart';
import 'package:horoscope_sirius_2021/api/horoscope_api.dart';
import 'package:horoscope_sirius_2021/dao/hive_builder.dart';
import 'package:horoscope_sirius_2021/dao/horo_dao_impl.dart';
import 'package:horoscope_sirius_2021/models/full_horo.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final horoService = RM.inject<HoroService>(() => HoroService());

class HoroService {
  HoroscopeApi? api;

  Future<void> init() async {
    var hive = await HiveBuilder.build();
    var options =
        BaseOptions(baseUrl: 'https://ignio.com/r/export/utf/xml/daily');
    api = HoroscopeApi(dao: HoroDaoImpl(hive.box), dio: Dio(options));
    await api!.init();
    horoService.notify();
  }

  FullHoro? getHoroBySign(String sign) {
    return api!.getHoroBySign(sign);
  }
}
