import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common_widgets/page_with_resizing_image.dart';
import 'package:horoscope_sirius_2021/screens/auth/widgets/register_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageWithResizingImage(
      logoImage: 'assets/logo.png',
      logoTitle: 'Astrology magic',
      content: RegisterForm(),
    );
  }
}
