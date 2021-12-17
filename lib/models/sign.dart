import 'package:hive_flutter/hive_flutter.dart';

part 'sign.g.dart';

@HiveType(typeId: 5)
class Sign extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String title;

  Sign({
    required this.name,
    required this.title,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sign && other.name == name && other.title == title;
  }

  @override
  int get hashCode => name.hashCode ^ title.hashCode;
}
