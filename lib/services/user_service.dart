import 'package:hive/hive.dart';
import 'package:horoscope_sirius_2021/models/sign.dart';
import 'package:horoscope_sirius_2021/models/user.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final userService = RM.inject<UserService>(
  () => UserService(),
  autoDisposeWhenNotUsed: false,
);

class UserService {
  Box<UserInfo?>? userBox;

  Future<void> init() async {
    Hive.registerAdapter(UserInfoAdapter());
    Hive.registerAdapter(SignAdapter());
    userBox = await Hive.openBox('User');
  }

  UserInfo? getUser() {
    return userBox!.get('currentUser');
  }

  Future<void> setUser(UserInfo user) async {
    await userBox!.put('currentUser', user);
    userService.notify();
  }

  void deleteUser() {
    userBox!.delete('currentUser');
  }
}
