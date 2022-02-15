import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/common_widgets/horoscope_body.dart';
import 'package:horoscope_sirius_2021/common_widgets/magic_loader.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/screens/horoscope/horoscope.dart';
import 'package:horoscope_sirius_2021/services/balaboba_service.dart';
import 'package:horoscope_sirius_2021/services/user_service.dart';

import '../../services/horoscope_service.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  late final sign = userService.state.getUser()!.sign;
  late final name = userService.state.getUser()!.name;

  @override
  Widget build(BuildContext context) {
    final zodiacSign = allSigns.firstWhere((element) => element.sign == sign);
    return SpacePage(
        body: Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: HoroscopeBody(
        picture: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  HoroscopeMainPicture(sign: zodiacSign),
                  Text(
                    '$name, \nзвёзды предсказали',
                    style: subtitleTextStyle,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        content: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Личный гороскоп на сегодня:\n\n" + horoService.state.getHoroBySign(zodiacSign.sign.name)!.common.today,
                      style: headerMenuStyle.copyWith(fontSize: 20)),
                ),
              ],
            ),
          )
          // FutureBuilder<String>(
          //     future: balabobaService.state
          //         .getBalaboba(name + ", " + zodiacSign.sign.title),
          //     // a previously-obtained Future<String> or null
          //     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          //       if (snapshot.hasData) {
          //         return SingleChildScrollView(
          //           physics: const BouncingScrollPhysics(),
          //           child: Column(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(20),
          //                 child: Text(snapshot.data!,
          //                     style: headerMenuStyle.copyWith(fontSize: 20)),
          //               ),
          //             ],
          //           ),
          //         );
          //       } else {
          //         return MagicLoader();
          //       }
          //     })
        ],
        circles: null,
      ),
    ));
  }
}
