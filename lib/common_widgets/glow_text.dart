import 'package:flutter/material.dart';

class GlowText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const GlowText({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle.copyWith(
        color: Colors.white,
        shadows: const <Shadow>[
          Shadow(
            offset: Offset(0, 0),
            blurRadius: 5.0,
            color: Color(0xFF000000),
          ),
          Shadow(
            offset: Offset(0.5, 0.5),
            blurRadius: 10.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
