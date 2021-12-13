import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:horoscope_sirius_2021/api/horoscope_api.dart';
import 'package:horoscope_sirius_2021/dao/hive_builder.dart';
import 'package:horoscope_sirius_2021/dao/horo_dao_impl.dart';
import 'package:horoscope_sirius_2021/models/full_horo.dart';
import 'package:horoscope_sirius_2021/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final horoService = RM.inject<HoroService>(() => HoroService());

class HoroService {

  HoroscopeApi? api;

  Future<void> init() async {
    var hive = await HiveBuilder.build();
    var options = BaseOptions(
      baseUrl: 'https://ignio.com/r/export/utf/xml/daily',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    api = HoroscopeApi(dao: HoroDaoImpl(hive.box), dio: Dio(options));
    await api!.init();
  }

  FullHoro? getHoroBySign(String sign) {
    return api!.getHoroBySign(sign);
  }

}