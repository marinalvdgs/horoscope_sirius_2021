import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/screens/menu/menu_screen.dart';

class SignsScreen extends StatelessWidget {
  const SignsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: CardsContainer(
        list: allSigns,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
