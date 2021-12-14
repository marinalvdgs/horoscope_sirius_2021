import 'package:hive/hive.dart';
import 'package:horoscope_sirius_2021/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final userService = RM.inject<UserService>(
  () => UserService(),
  onInitialized: (s) {
    s?.init();
  },
);

class UserService {
  late final Box<UserInfo> userBox;

  void init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.registerAdapter(UserInfoAdapter());
    userBox = await Hive.openBox('User');
    userService.notify();
  }

  UserInfo? getUser() {
    return userBox.get('currentUser');
  }

  void setUser(UserInfo user) {
    userBox.clear();
    userBox.put('currentUser', user);
  }
}
