import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:horoscope_sirius_2021/screens/menu/menu_screen.dart';
import 'package:flutter/services.dart';
import 'package:horoscope_sirius_2021/common_widgets/magic_loader.dart';
import 'package:horoscope_sirius_2021/screens/auth/auth_screen.dart';
import 'package:horoscope_sirius_2021/services/app_settings_service.dart';
import 'package:horoscope_sirius_2021/services/horoscope_service.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final initService = appSettingsService.state.init();
  final initHoroService = horoService.state.init();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: Future.wait([initService, initHoroService]),
          builder: (context, value) {
            if (appSettingsService.state.settingsBox == null) {
              return const MagicLoader();
            }
            final isLoggedIn = appSettingsService.state.isUserLoggedIn();
            if (isLoggedIn) {
              return const MenuScreen();
            }
            return const AuthScreen();
          }),
    );
  }
}
