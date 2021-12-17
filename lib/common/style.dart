import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const subtitleColor = Color(0xFFCED7E0);
const buttonColor = Color(0xFF282157);
const darkBackgroundColor = Color(0xFF051427);
const darkGradientButtonColor = Color(0xFF071345);
const lightGradientButtonColor = Color(0xFF010630);

final headerTextStyle = GoogleFonts.philosopher(
  textStyle: const TextStyle(
    color: Colors.white,
    fontSize: 48,
  ),
);

final subtitleTextStyle = headerTextStyle.copyWith(
  fontSize: 20,
  color: subtitleColor,
);

final titleTextStyle = GoogleFonts.kosugiMaru(
  textStyle: const TextStyle(fontSize: 30),
);

final buttonTextStyle = GoogleFonts.yanoneKaffeesatz(
  fontSize: 24,
  color: Colors.white,
  letterSpacing: 4.5,
);

final headerMenuStyle = GoogleFonts.sairaCondensed(
  textStyle: const TextStyle(fontSize: 30),
  color: Colors.white,
  fontSize: 50,
);

const cardShadow = BoxShadow(
  color: Colors.deepPurple,
  blurRadius: 3,
);

const cardGradient = LinearGradient(
  colors: [
    darkGradientButtonColor,
    lightGradientButtonColor,
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  stops: [0.25, 0.90],
);

const appName = "Astrology Magic";
