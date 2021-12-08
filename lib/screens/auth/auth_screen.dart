import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common_widgets/glow_text.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/screens/auth/widgets/input_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: Image.asset(
              'assets/logo.png',
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: GlowText(text: 'Astrology magic', fontSize: 30),
          ),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: Colors.white.withOpacity(0.2),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: const [
                        InputTextField(icon: Icons.person, hintText: 'Имя'),
                        InputTextField(
                            icon: Icons.calendar_today,
                            hintText: 'Дата рождения'),
                        InputTextField(
                            icon: Icons.mobile_friendly,
                            hintText: 'Номер телефона')
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
