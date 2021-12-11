import 'package:hive/hive.dart';

part 'app_settings.g.dart';

@HiveType(typeId: 3)
class AppSettings {
  @HiveField(0)
  final bool isLoggedIn;

  AppSettings({
    required this.isLoggedIn,
  });

  AppSettings copyWith({
    bool? isLoggedIn,
  }) {
    return AppSettings(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
