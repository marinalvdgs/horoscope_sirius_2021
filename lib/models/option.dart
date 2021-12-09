import 'package:flutter/material.dart';

class Option {
  Image image;
  String title;

  Option({required this.image, required this.title});
}

final options = [
  Option(image: Image.asset('assets/horoscope.png'), title: "Horoscope"),
  Option(image: Image.asset('assets/compatibility.png'), title: "Compatibility"),
  Option(image: Image.asset('assets/personal.png'), title: "Personal"),
  Option(image: Image.asset('assets/profile.png'), title: "Profile"),
];
