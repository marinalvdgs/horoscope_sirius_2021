import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_sirius_2021/common/constants.dart';
import 'package:horoscope_sirius_2021/common_widgets/glow_text.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/screens/auth/widgets/input_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = Tween<double>(begin: 0.5, end: 1)
      .animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

  late StreamSubscription<bool> keyboardSubscription;
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

  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
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
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Регистрация', style: headerTextStyle),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Заполните все поля, чтобы войти',
                            style: headerTextStyle.copyWith(
                              fontSize: 20,
                              color: const Color(0xFFCED7E0),
                            ),
                          ),
                        ),
                        const InputTextField(
                          icon: Icons.person,
                          hintText: 'Имя',
                        ),
                        const InputTextField(
                          icon: Icons.calendar_today,
                          hintText: 'Дата рождения',
                        ),
                        const InputTextField(
                          icon: Icons.mobile_friendly,
                          hintText: 'Номер телефона',
                        )
                      ],
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {},
                      child: Ink(
                        color: const Color(0xFF282157),
                        height: kBottomNavigationBarHeight,
                        child: Center(
                          child: Text(
                            'ПРОДОЛЖИТЬ',
                            style: GoogleFonts.ubuntuMono(
                              fontSize: 24,
                              color: Colors.white,
                              letterSpacing: 4.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
