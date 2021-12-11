import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/models/option.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/screens/auth/widgets/card.dart';

class CardsContainer extends StatelessWidget {
  const CardsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Astrology Magic",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.sairaCondensed(
                    textStyle: Theme.of(context).textTheme.headline4,
                    color: Colors.white,
                    fontSize: 40,
                  ))),
          Expanded(
              child: Center(
                  child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: options.length,
            itemBuilder: (context, index) {
              return CardInstance(
                option: options[index],
              );
            },
          )))
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


