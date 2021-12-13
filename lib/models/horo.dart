import 'package:hive_flutter/adapters.dart';

part 'horo.g.dart';


@HiveType(typeId: 1)
class Horo extends HiveObject {
  
  @HiveField(0)
  String sign;

  @HiveField(1)
  String yesterday;

  @HiveField(2)
  String today;
  
  @HiveField(3)
  String tomorrow;
  
  @HiveField(4)
  String tomorrow02;

  @HiveField(5)
  DateTime date;
  

  Horo(
      {
      required this.sign,
      required this.yesterday,
      required this.today,
      required this.tomorrow,
      required this.tomorrow02,
      required this.date});

  Horo.fromJson(Map<String, dynamic> json)
      : 
        sign = json['sign'],
        today = json['today']["\$t"],
        tomorrow = json['tomorrow']["\$t"],
        yesterday = json['yesterday']["\$t"],
        tomorrow02 = json['tomorrow02']["\$t"],
        date = json['date'];

  Horo toHoro() => Horo(sign : sign, yesterday : yesterday, today : today, tomorrow : tomorrow, tomorrow02 : tomorrow02, date : date);    
}

final signs = [
  'aries',
  'taurus',
  'gemini',
  'cancer',
  'leo',
  'virgo',
  'libra',
  'scorpio',
  'sagittarius',
  'capricorn',
  'aquarius',
  'pisces'
];
