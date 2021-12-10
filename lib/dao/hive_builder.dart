import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:horoscope_sirius_2021/dao/horo_model.dart';

class HiveBuilder {
  final Box<HoroHiveModel> horoBox;

  HiveBuilder._(this.horoBox);

  static Future<HiveBuilder> build() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HoroHiveModelAdapter());
    return HiveBuilder._(
      await Hive.openBox('feed'),
    );
  }
}
