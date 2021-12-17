import 'dart:math';

import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/common_widgets/circle_text.dart';
import 'package:horoscope_sirius_2021/common_widgets/horoscope_body.dart';
import 'package:horoscope_sirius_2021/common_widgets/icon_title.dart';
import 'package:horoscope_sirius_2021/common_widgets/magic_loader.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/models/signs_compatibility.dart';
import 'package:horoscope_sirius_2021/screens/compatibility/widgets/compatibility_image.dart';
import 'package:horoscope_sirius_2021/services/compatibility_service.dart';

class SignsCompatibilityScreen extends StatefulWidget {
  final String woman;
  final String man;

  const SignsCompatibilityScreen({
    Key? key,
    required this.woman,
    required this.man,
  }) : super(key: key);

  @override
  State<SignsCompatibilityScreen> createState() =>
      _SignsCompatibilityScreenState();
}

class _SignsCompatibilityScreenState extends State<SignsCompatibilityScreen> {
  late final loadData = compatibilityService.state
      .getCompatibilityForSigns(woman: widget.woman, man: widget.man);

  String getImagePath(String name) {
    return 'assets/signs/$name.png';
  }

  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: FutureBuilder<SignsCompatibility>(
        future: loadData,
        builder: (context, data) {
          if (!data.hasData) {
            return MagicLoader();
          }
          final result = data.data!;
          return Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Совместимость',
                      style: headerTextStyle,
                    )
                  ],
                ),
                Expanded(
                  child: HoroscopeBody(
                    picture: CompatibilityImage(
                      left: getImagePath(widget.woman),
                      right: getImagePath(widget.man),
                    ),
                    circles: [
                      CircleText(
                        title: "Любовь",
                        angle: result.compatibility * pi,
                        color: Colors.red,
                      ),
                      CircleText(
                        title: "Брак",
                        angle: result.marriage * pi,
                        color: Colors.green,
                      ),
                      CircleText(
                        title: "Постель",
                        angle: result.sex * pi,
                        color: Colors.cyan,
                      ),
                    ],
                    content: [
                      const IconTitle(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        title: "Любовь",
                      ),
                      Horoscopecontent(text: result.love),
                      const IconTitle(
                        icon: Icon(
                          Icons.family_restroom,
                          color: Colors.cyan,
                        ),
                        title: "Семья",
                      ),
                      Horoscopecontent(text: result.family),
                      const IconTitle(
                        icon: Icon(
                          Icons.attach_money,
                          color: Colors.yellowAccent,
                        ),
                        title: "Бизнес и работа",
                      ),
                      Horoscopecontent(text: result.business)
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
