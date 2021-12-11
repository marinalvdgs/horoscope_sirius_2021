import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 4)
class UserInfo {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String birth;
  @HiveField(2)
  final String phone;

  UserInfo({
    required this.name,
    required this.birth,
    required this.phone,
  });
}
