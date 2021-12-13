import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/enums.dart';
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          SizedBox(
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
          SizedBox(
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
        ]),
      ),
    );
  }
}
