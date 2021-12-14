import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/models/option.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/screens/auth/widgets/card.dart';
import 'package:horoscope_sirius_2021/screens/horoscope/horoscope.dart';

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
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return CardInstance(
                    option: options[index],
                    nextScreen: namesMenuToScreen[options[index].title]!,
                  );
                },
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