import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/screens/compatibility/compatibility_screen.dart';
import 'package:horoscope_sirius_2021/screens/horoscope/horoscope.dart';
import 'package:horoscope_sirius_2021/screens/personal/personal_screen.dart';
import 'package:horoscope_sirius_2021/screens/profile/profile_screen.dart';
import 'package:horoscope_sirius_2021/screens/signs/signs.dart';

class CardOption {
  String image;
  String title;

  CardOption({required this.image, required this.title});
}

final options = [
  CardOption(image: namesToUrl["Horoscope"]!, title: "Horoscope"),
  CardOption(image: namesToUrl["Compatibility"]!, title: "Compatibility"),
  CardOption(image: namesToUrl["Personal"]!, title: "Personal"),
  CardOption(image: namesToUrl["Profile"]!, title: "Profile"),
];

Map<String, String> namesToUrl = {
  "Horoscope": "assets/horoscope.png",
  "Compatibility": "assets/compatibility.png",
  "Personal": "assets/personal.png",
  "Profile": "assets/profile.png",
};

Map<String, Widget> namesMenuToScreen = {
  "Horoscope": const SignsScreen(),
  "Compatibility": const CompatibilityScreen(),
  "Personal": PersonalScreen(),
  "Profile": const ProfileScreen(),
};
