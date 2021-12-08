import 'package:flutter/material.dart';

class GlowText extends StatelessWidget {
  final String text;
  final double fontSize;
  const GlowText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        shadows: const <Shadow>[
          Shadow(
            offset: Offset(0, 0),
            blurRadius: 3.0,
            color: Color(0xFF000000),
          ),
          Shadow(
            offset: Offset(0.5, 0.5),
            blurRadius: 10.0,
            color: Color(0xFF845EC2),
          ),
        ],
      ),
    );
  }
}
