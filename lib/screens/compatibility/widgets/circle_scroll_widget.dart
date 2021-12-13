import 'dart:math';

import 'package:flutter/material.dart';

import 'package:horoscope_sirius_2021/common/enums.dart';
import 'package:horoscope_sirius_2021/common_widgets/circle_wheel_view/circle_wheel_child_looping_list_delegate.dart';
import 'package:horoscope_sirius_2021/common_widgets/circle_wheel_view/circle_wheel_scroll_view.dart';

class CircleScrollWidget extends StatelessWidget {
  final List<Widget> children;
  final WheelDirection direction;
  const CircleScrollWidget({
    Key? key,
    required this.children,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(direction == WheelDirection.right ? pi : 0),
      child: CircleListScrollView.useDelegate(
        radius: MediaQuery.of(context).size.height * 0.45,
        itemExtent: 100,
        physics: const CircleFixedExtentScrollPhysics(),
        childDelegate:
            CircleListWheelChildLoopingListDelegate(children: children),
      ),
    );
  }
}