import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/services/horoscope_service.dart';

class IconTitle extends StatelessWidget {
  final Icon icon;
  final String title;

  const IconTitle({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
          child: icon,
        ),
        Text(title, style: buttonTextStyle.copyWith(fontSize: 20)),
      ],
    );
  }
}

class Horoscopecontent extends StatelessWidget {
  final String? text;

  const Horoscopecontent({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Text(text ?? "", style: headerMenuStyle.copyWith(fontSize: 14)),
    );
  }
}
