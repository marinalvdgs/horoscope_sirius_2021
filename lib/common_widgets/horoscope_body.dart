import 'package:flutter/material.dart';

import 'package:horoscope_sirius_2021/common_widgets/bottom_container.dart';

class HoroscopeBody extends StatelessWidget {
  final Widget picture;
  final List<Widget>? circles;
  final List<Widget> content;

  const HoroscopeBody({
    Key? key,
    required this.picture,
    required this.circles,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: picture,
        ),
        Expanded(
          child: BottomContainer(
            child: Column(
              children: [
                if (circles != null) Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: circles!,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(children: content),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
