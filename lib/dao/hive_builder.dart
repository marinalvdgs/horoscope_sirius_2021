import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:horoscope_sirius_2021/dao/horo_model.dart';
import 'package:horoscope_sirius_2021/models/horo.dart';

class HiveBuilder {
  final Box<FullHoroHiveModel> box;

  HiveBuilder._(this.box);

  static Future<HiveBuilder> build() async {
    Hive.registerAdapter(HoroAdapter());
    Hive.registerAdapter(FullHoroHiveModelAdapter());
    return HiveBuilder._(
      await Hive.openBox('horo'),
    );
  }
}
