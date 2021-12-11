import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horoscope_sirius_2021/common_widgets/magic_loader.dart';
import 'package:horoscope_sirius_2021/screens/auth/auth_screen.dart';
import 'package:horoscope_sirius_2021/screens/menu/menu_screen.dart';
import 'package:horoscope_sirius_2021/services/app_settings_service.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: appSettingsService.state.init(),
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
