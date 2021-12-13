import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/enums.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/common_widgets/circle_wheel_view/circle_wheel_child_looping_list_delegate.dart';
import 'package:horoscope_sirius_2021/common_widgets/circle_wheel_view/circle_wheel_scroll_view.dart';

import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/screens/compatibility/widgets/circle_scroll_widget.dart';
import 'package:horoscope_sirius_2021/screens/compatibility/widgets/sign_card.dart';

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Совместимость', style: headerTextStyle),
                  Text('Проверьте совместимость в любви и работе',
                      style: subtitleTextStyle),
                ],
              ),
            ],
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, top: 24),
                          child: Text('Женщина', style: subtitleTextStyle),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: CircleScrollWidget(
                                children: allSigns
                                    .map((e) => SignCard(
                                          sign: e,
                                          direction: WheelDirection.left,
                                        ))
                                    .toList(),
                                direction: WheelDirection.left),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12, top: 24),
                          child: Text('Мужчина', style: subtitleTextStyle),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: CircleScrollWidget(
                                children: allSigns
                                    .map((e) => SignCard(
                                          sign: e,
                                          direction: WheelDirection.right,
                                        ))
                                    .toList(),
                                direction: WheelDirection.right),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 96),
                    child: FloatingActionButton.extended(
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
