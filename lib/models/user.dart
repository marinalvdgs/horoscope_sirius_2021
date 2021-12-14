import 'package:hive/hive.dart';

import 'sign.dart';

part 'user.g.dart';

@HiveType(typeId: 6)
class UserInfo extends HiveObject {
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfo &&
        other.name == name &&
        other.birth == birth &&
        other.phone == phone &&
        other.sign == sign;
  }

  @override
  int get hashCode {
    return name.hashCode ^ birth.hashCode ^ phone.hashCode ^ sign.hashCode;
  }
}
