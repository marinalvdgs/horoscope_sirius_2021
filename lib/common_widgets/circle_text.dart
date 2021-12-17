import 'package:flutter/cupertino.dart';
import 'package:horoscope_sirius_2021/common/style.dart';

import 'loader_horo.dart';

class CircleText extends StatelessWidget {
  final String title;
  final double angle;
  final Color color;

  const CircleText(
      {Key? key, required this.title, required this.angle, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: subtitleTextStyle.copyWith(
                  fontSize: 18,
                ),
              )),
          SizedBox(
            height: 60,
            width: 60,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1000),
              tween: Tween(begin: 0.0, end: angle),
              builder: (BuildContext context, dynamic value, Widget? child) {
                return CustomPaint(
                  foregroundPainter: ArcPainter(angle: value, color: color),
                  child: Center(
                      child: Text((value / 360.0 * 100).toInt().toString(),
                          style: buttonTextStyle.copyWith(fontSize: 18))),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
