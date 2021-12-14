import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/screens/compatibility/compatibility_screen.dart';
import 'package:horoscope_sirius_2021/screens/horoscope/horoscope.dart';

class CardOption {
  Image image;
  String title;

  CardOption({required this.image, required this.title});
}

final options = [
  CardOption(image: Image.asset(namesToUrl["Horoscope"]!, height: 200), title: "Horoscope"),
  CardOption(image: Image.asset(namesToUrl["Compatibility"]!, height: 200), title: "Compatibility"),
  CardOption(image: Image.asset(namesToUrl["Personal"]!, height: 200), title: "Personal"),
  CardOption(image: Image.asset(namesToUrl["Profile"]!, height: 200), title: "Profile"),
];

Map<String, String> namesToUrl = {
  "Horoscope" : "assets/horoscope.png",
  "Compatibility" : "assets/compatibility.png",
  "Personal" : "assets/personal.png",
  "Profile" : "assets/profile.png",
};

Map<String, StatefulWidget> namesMenuToScreen = {
  "Horoscope" : const HoroscopeScreen(),
  "Compatibility" : const CompatibilityScreen(),
  "Personal" : const HoroscopeScreen(),
  "Profile" : const HoroscopeScreen(),
};