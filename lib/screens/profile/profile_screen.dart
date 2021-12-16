import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common_widgets/page_with_resizing_image.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/screens/auth/auth_screen.dart';
import 'package:horoscope_sirius_2021/screens/profile/widgets/profile_info.dart';
import 'package:horoscope_sirius_2021/services/user_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final sign = userService.state.getUser()!.sign;
  @override
  Widget build(BuildContext context) {
    final zodiacSign = allSigns.firstWhere((element) => element.sign == sign);
    return PageWithResizingImage(
      logoImage: zodiacSign.image,
      logoTitle: zodiacSign.sign.title,
      content: const ProfileInfo(),
      appBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const AuthScreen()));
            },
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
          )
        ],
      ),
    );
  }
}
