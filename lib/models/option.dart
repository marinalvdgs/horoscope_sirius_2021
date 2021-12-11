import 'package:flutter/material.dart';

class Option {
  Image image;
  String title;

  Option({required this.image, required this.title});
}

final options = [
  Option(image: Image.asset('assets/horoscope.png', height: 200), title: "Horoscope"),
  Option(image: Image.asset('assets/compatibility.png', height: 200), title: "Compatibility"),
  Option(image: Image.asset('assets/personal.png', height: 200), title: "Personal"),
  Option(image: Image.asset('assets/profile.png', height: 200), title: "Profile"),
];
