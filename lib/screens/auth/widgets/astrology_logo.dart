import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/common_widgets/glow_text.dart';

class AstrologyLogo extends StatefulWidget {
  const AstrologyLogo({Key? key}) : super(key: key);

  @override
  _AstrologyLogoState createState() => _AstrologyLogoState();
}

class _AstrologyLogoState extends State<AstrologyLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = Tween<double>(begin: 0.5, end: 1)
      .animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

  @override
  initState() {
    _controller.forward();
    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
    super.initState();
  }

  late StreamSubscription<bool> keyboardSubscription;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizeTransition(
          sizeFactor: _animation,
          child: ScaleTransition(
            scale: _animation,
            child: Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GlowText(
            text: 'Astrology magic',
            textStyle: titleTextStyle,
          ),
        ),
      ],
    );
  }
}
