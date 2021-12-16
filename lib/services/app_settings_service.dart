import 'package:hive/hive.dart';
import 'package:horoscope_sirius_2021/models/app_settings.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final appSettingsService =
    RM.inject<AppSettingsService>(() => AppSettingsService());

class AppSettingsService {
  Box<AppSettings>? settingsBox;

  Future<void> init() async {
    Hive.registerAdapter(AppSettingsAdapter());
    settingsBox = await Hive.openBox('Settings');
  }

  bool isUserLoggedIn() {
    return settingsBox!.get('settings')?.isLoggedIn ?? false;
  }

  void setLoggedIn() {
    final settings =
        settingsBox!.get('settings') ?? AppSettings(isLoggedIn: true);
    settingsBox!.put('settings', settings.copyWith(isLoggedIn: true));
  }

  void onLogOut() {
    settingsBox!.put('settings', AppSettings(isLoggedIn: false));
  }
}
