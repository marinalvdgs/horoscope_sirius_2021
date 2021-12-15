import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/models/option.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/screens/auth/widgets/card.dart';
import 'package:horoscope_sirius_2021/screens/compatibility/compatibility_screen.dart';
import 'package:horoscope_sirius_2021/screens/profile/profile_screen.dart';

class CardsContainer extends StatelessWidget {
  const CardsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 20.0),
            child: Text(
              appName,
              textAlign: TextAlign.left,
              style: headerMenuStyle,
            ),
          ),
          Expanded(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CardInstance(option: options[0]),
                  CardInstance(
                    option: options[1],
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CompatibilityScreen()));
                    },
                  ),
                  CardInstance(option: options[2]),
                  CardInstance(
                    option: options[3],
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                    },
                  )
                ],
              ),
            ),
          ),
        ]);
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpacePage(body: CardsContainer());
  }
}
