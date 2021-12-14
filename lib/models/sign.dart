import 'package:hive_flutter/hive_flutter.dart';

part 'sign.g.dart';

@HiveType(typeId: 5)
class Sign {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String title;

  Sign({
    required this.name,
    required this.title,
  });
}
