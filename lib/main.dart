import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:horoscope_sirius_2021/screens/menu/menu_screen.dart';
import 'package:flutter/services.dart';
import 'package:horoscope_sirius_2021/common_widgets/magic_loader.dart';
import 'package:horoscope_sirius_2021/screens/auth/auth_screen.dart';
import 'package:horoscope_sirius_2021/services/app_settings_service.dart';
import 'package:horoscope_sirius_2021/services/balaboba_service.dart';
import 'package:horoscope_sirius_2021/services/horoscope_service.dart';
import 'package:horoscope_sirius_2021/services/user_service.dart';

import 'models/option.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  await Hive.initFlutter();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final initHoroService = horoService.state.init();
  final initAppSettingsService = appSettingsService.state.init();
  final initUserService = userService.state.init();
  final initBalabobaService = balabobaService.state.init();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: Future.wait(
              [initHoroService, initAppSettingsService, initBalabobaService]),
          builder: (context, value) {
            if (appSettingsService.state.settingsBox == null) {
              return MagicLoader();
            }
            final isLoggedIn = appSettingsService.state.isUserLoggedIn();
            return FutureBuilder(
                future: initUserService,
                builder: (context, val) {
                  if (isLoggedIn) {
                    return MenuScreen(
                      list: options,
                    );
                  }
                  return const AuthScreen();
                });
          }),
    );
  }
}
