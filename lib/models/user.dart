import 'package:hive/hive.dart';

import 'sign.dart';

part 'user.g.dart';

@HiveType(typeId: 4)
class UserInfo {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String birth;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final Sign sign;

  UserInfo({
    required this.name,
    required this.birth,
    required this.phone,
    required this.sign,
  });
}
