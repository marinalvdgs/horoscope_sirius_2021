import 'dart:math';

import 'package:flutter/material.dart';

import 'package:horoscope_sirius_2021/common/enums.dart';
import 'package:horoscope_sirius_2021/common_widgets/circle_wheel_view/circle_wheel_child_looping_list_delegate.dart';
import 'package:horoscope_sirius_2021/common_widgets/circle_wheel_view/circle_wheel_scroll_view.dart';

class CircleScrollWidget extends StatelessWidget {
  final List<Widget> children;
  final WheelSide side;
  final Function(int) onItemChanged;

  const CircleScrollWidget({
    Key? key,
    required this.children,
    required this.side,
    required this.onItemChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(side == WheelSide.right ? pi : 0),
      child: Stack(
        children: [
          Transform.scale(
            scale: 4.5,
            child: Transform.translate(
              offset: Offset(-MediaQuery.of(context).size.width / 4, 0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0x330089BA),
                  boxShadow: const [
                    BoxShadow(color: Color(0x552C73D2), blurRadius: 8)
                  ],
                  border:
                      Border.all(color: const Color(0xFF2C73D2), width: 0.2),
                ),
              ),
            ),
          ),
          CircleListScrollView.useDelegate(
            radius: MediaQuery.of(context).size.height * 0.35,
            itemExtent: 190,
            clipToSize: false,
            renderChildrenOutsideViewport: true,
            physics: const CircleFixedExtentScrollPhysics(),
            onSelectedItemChanged: onItemChanged,
            childDelegate:
                CircleListWheelChildLoopingListDelegate(children: children),
          ),
        ],
      ),
    );
  }
}
