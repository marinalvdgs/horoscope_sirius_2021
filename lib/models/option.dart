import 'package:flutter/material.dart';

class Option {
  Image image;
  String title;

  Option({required this.image, required this.title});
}

final options = [
  Option(image: Image.asset('assets/images/scales.jpg'), title: "First title"),
  Option(image: Image.asset('assets/images/scales.jpg'), title: "First title"),
  Option(image: Image.asset('assets/images/scales.jpg'), title: "First title"),
  Option(image: Image.asset('assets/images/scales.jpg'), title: "First title"),
];
