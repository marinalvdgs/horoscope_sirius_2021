import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/models/option.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/screens/auth/widgets/card.dart';
import 'package:horoscope_sirius_2021/screens/horoscope/horoscope.dart';

class CardsContainer extends StatelessWidget {
  final List<CardOption> list;
  final ScrollPhysics physics;

  const CardsContainer({Key? key, required this.list, required this.physics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 20.0),
          child: Row(
            children: [
              if (Navigator.of(context).canPop())
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              Text(
                appName,
                textAlign: TextAlign.left,
                style: headerMenuStyle,
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              physics: physics,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return CardInstance(
                  option: list[index],
                  nextScreen: namesMenuToScreen[list[index].name] ??
                      HoroscopeScreen(sign: allSigns[index]),
                  height: 150,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MenuScreen extends StatelessWidget {
  final List<CardOption> list;

  const MenuScreen({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacePage(
        body: CardsContainer(
      list: list,
      physics: const NeverScrollableScrollPhysics(),
    ));
  }
}
