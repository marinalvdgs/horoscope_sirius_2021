import 'dart:math';

import 'package:flutter/material.dart';

import 'package:horoscope_sirius_2021/common/enums.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/common_widgets/glow_text.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';

class SignCard extends StatefulWidget {
  final ZodiacSign sign;
  final WheelDirection direction;
  const SignCard({
    Key? key,
    required this.sign,
    required this.direction,
  }) : super(key: key);

  @override
  State<SignCard> createState() => _SignCardState();
}

class _SignCardState extends State<SignCard> {
  late final image = AssetImage(widget.sign.image);

  @override
  void didChangeDependencies() {
    precacheImage(image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(widget.direction == WheelDirection.right ? 100 : 0, 0),
      child: Container(
        height: 100,
        width: 130,
        decoration: BoxDecoration(
          gradient: cardGradient,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
            image: const AssetImage('assets/rain.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                const Color(0xFF210535).withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        alignment: Alignment.centerRight,
        transform: Matrix4.rotationY(
            widget.direction == WheelDirection.right ? pi : 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: Image(
                  image: image,
                  height: 100,
                  width: 100,
                  errorBuilder: (context, error, stackTrace) => SizedBox(
                    height: 50,
                    width: 50,
                    child: Text(
                      'Error',
                      style: headerTextStyle.copyWith(
                          fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GlowText(
                  text: widget.sign.title,
                  textStyle: headerTextStyle.copyWith(
                      fontSize: 24, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
