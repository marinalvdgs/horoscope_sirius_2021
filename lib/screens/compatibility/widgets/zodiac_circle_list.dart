import 'package:flutter/material.dart';

import 'package:horoscope_sirius_2021/common/enums.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/screens/compatibility/widgets/sign_card.dart';

import 'circle_scroll_widget.dart';

class ZodiacCircleList extends StatelessWidget {
  final WheelSide side;
  final String title;
  final Function(int) onSignChange;

  const ZodiacCircleList({
    Key? key,
    required this.side,
    required this.title,
    required this.onSignChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: side == WheelSide.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 24, 12, 48),
          child: Text(title, style: subtitleTextStyle),
        ),
        Flexible(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: CircleScrollWidget(
              children: allSigns
                  .map((e) => SignCard(
                        sign: e,
                        side: side,
                      ))
                  .toList(),
              side: side,
              onItemChanged: onSignChange,
            ),
          ),
        ),
      ],
    );
  }
}
