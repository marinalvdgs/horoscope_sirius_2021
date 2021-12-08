import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common_widgets/glow_text.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Center(
            child: Opacity(
              opacity: 0.6,
              child: Image.asset('assets/logo.png'),
            ),
          ),
        ),
        const SizedBox.shrink(),
        const GlowText(text: 'Astrology magic', fontSize: 30),
      ],
    );
  }
}
