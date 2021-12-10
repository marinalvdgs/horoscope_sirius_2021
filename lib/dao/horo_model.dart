import 'package:hive/hive.dart';
import 'package:horoscope_sirius_2021/models/horo.dart';

part 'horo_model.g.dart';

@HiveType(typeId: 0)
class HoroHiveModel extends HiveObject {

  @HiveField(0)
  int id;

  @HiveField(1)
  String yesterday;
  
  @HiveField(2)
  String today;
  
  @HiveField(3)
  String tomorrow;

  @HiveField(4)
  String tomorrow02;

  HoroHiveModel({required this.id, required this.yesterday, required this.today, required this.tomorrow, required this.tomorrow02});

  HoroHiveModel.fromHoro(Horo horo): 
    id = horo.id,
    yesterday  = horo.yesterday,
    today = horo.today,
    tomorrow = horo.tomorrow,
    tomorrow02 = horo.tomorrow02;

  Horo toHoro() => Horo(id: id, yesterday: yesterday, today: today, tomorrow: tomorrow, tomorrow02: tomorrow02);
}
