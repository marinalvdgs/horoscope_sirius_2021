import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common_widgets/magic_loader.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/services/horoscope_service.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: SizedBox(
            height: 40,
            child: FutureBuilder(builder: (context, value) {
            if (horoService.state.api == null) {
              return const MagicLoader();
            }
            return Text(horoService.state.getHoroBySign('libra')?.love.today ?? "text");
          },
          future: horoService.state.init())
          ),
    );
  }
}
