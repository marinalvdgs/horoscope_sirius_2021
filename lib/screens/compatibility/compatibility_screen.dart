import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/enums.dart';
import 'package:horoscope_sirius_2021/common/style.dart';

import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/screens/compatibility/widgets/zodiac_circle_list.dart';

class CompatibilityScreen extends StatefulWidget {
  const CompatibilityScreen({Key? key}) : super(key: key);

  @override
  _CompatibilityScreenState createState() => _CompatibilityScreenState();
}

class _CompatibilityScreenState extends State<CompatibilityScreen> {
  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: Column(
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
                    children: const [
                      ZodiacCircleList(side: WheelSide.left, title: 'Женщина'),
                      ZodiacCircleList(side: WheelSide.right, title: 'Мужчина')
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 128),
                    child: FloatingActionButton.extended(
                      //TODO: push to new screen
                      onPressed: () {},
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
    );
  }
}
