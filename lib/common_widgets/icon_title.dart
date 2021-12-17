import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/common_widgets/glow_text.dart';

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
          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
          child: icon,
        ),
        GlowText(text: title, textStyle: buttonTextStyle.copyWith(fontSize: 20)),
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
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Text(text ?? "", style: headerMenuStyle.copyWith(fontSize: 14)),
    );
  }
}
