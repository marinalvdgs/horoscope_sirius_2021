import 'package:hive/hive.dart';
import 'package:horoscope_sirius_2021/models/full_horo.dart';
import 'package:horoscope_sirius_2021/models/horo.dart';

part 'horo_model.g.dart';

@HiveType(typeId: 0)
class FullHoroHiveModel extends HiveObject {

  @HiveField(0)
  String sign;

  @HiveField(1)
  Horo love;
  
  @HiveField(2)
  Horo bisiness;
  
  @HiveField(3)
  Horo common;

  @HiveField(4)
  Horo health;

  FullHoroHiveModel({
    required this.sign, 
      required this.love,
      required this.bisiness,
      required this.common,
      required this.health,
  });

  FullHoroHiveModel.fromHoro(FullHoro horo): 
    sign = horo.sign,
    love = horo.love,
    bisiness = horo.bisiness,
    common = horo.common,
    health = horo.health;


  FullHoro toFullHoro() => FullHoro(sign : sign, love : love, bisiness : bisiness, common : common, health: health);
}