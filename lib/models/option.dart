import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/screens/compatibility/compatibility_screen.dart';
import 'package:horoscope_sirius_2021/screens/personal/personal_screen.dart';
import 'package:horoscope_sirius_2021/screens/profile/profile_screen.dart';
import 'package:horoscope_sirius_2021/screens/signs/signs.dart';

class CardOption {
  String image;
  String title;
  String name;

  CardOption({required this.image, required this.title, required this.name});
}

final options = [
  CardOption(
      image: namesToUrl["Horoscope"]!, name: "Horoscope", title: "Гороскоп"),
  CardOption(
      image: namesToUrl["Compatibility"]!,
      name: "Compatibility",
      title: "Совместимость"),
  CardOption(image: namesToUrl["Personal"]!, name: "Personal", title: "Личный"),
  CardOption(image: namesToUrl["Profile"]!, name: "Profile", title: "Профиль"),
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
  "Personal": const PersonalScreen(),
  "Profile": const ProfileScreen(),
};
