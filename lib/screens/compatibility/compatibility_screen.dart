import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/enums.dart';
import 'package:horoscope_sirius_2021/common/style.dart';

import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/screens/compatibility/signs_compatibility_screen.dart';
import 'package:horoscope_sirius_2021/screens/compatibility/widgets/zodiac_circle_list.dart';

class CompatibilityScreen extends StatefulWidget {
  const CompatibilityScreen({Key? key}) : super(key: key);

  @override
  _CompatibilityScreenState createState() => _CompatibilityScreenState();
}

class _CompatibilityScreenState extends State<CompatibilityScreen> {
  String womanSign = 'aries';
  String manSign = 'aries';

  void onWomanSignChange(int index) {
    womanSign = allSigns[index].sign.name;
  }

  void onManSignChange(int index) {
    manSign = allSigns[index].sign.name;
  }

  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Совместимость', style: headerTextStyle),
                      Flexible(
                        child: Text(
                          'Проверьте совместимость в любви и работе',
                          style: subtitleTextStyle,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: Row(
                      children: [
                        ZodiacCircleList(
                          side: WheelSide.left,
                          title: 'Женщина',
                          onSignChange: onWomanSignChange,
                        ),
                        ZodiacCircleList(
                          side: WheelSide.right,
                          title: 'Мужчина',
                          onSignChange: onManSignChange,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 128),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignsCompatibilityScreen(
                                  woman: womanSign, man: manSign)));
                        },
                        label: Text(
                          'ПРОВЕРИТЬ',
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
