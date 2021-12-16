import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common_widgets/circle_text.dart';
import 'package:horoscope_sirius_2021/common_widgets/horoscope_body.dart';
import 'package:horoscope_sirius_2021/common_widgets/icon_title.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/services/horoscope_service.dart';

class HoroscopeScreen extends StatefulWidget {
  final ZodiacSign sign;

  const HoroscopeScreen({Key? key, required this.sign}) : super(key: key);

  @override
  _HoroscopeScreenState createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> {
  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const TabBar(
              tabs: [
                Tab(text: "Yesterday"),
                Tab(text: "Today"),
                Tab(text: "Tomorrow"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              HoroscopePage(sign: widget.sign, day: "today"),
              HoroscopePage(sign: widget.sign, day: "yesterday"),
              HoroscopePage(sign: widget.sign, day: "tomorrow"),
            ],
          ),
        ),
      ),
    );
  }
}

class HoroscopePage extends StatefulWidget {
  final ZodiacSign sign;
  final String day;

  const HoroscopePage({Key? key, required this.sign, required this.day})
      : super(key: key);

  @override
  _HoroscopeBodyScreenState createState() => _HoroscopeBodyScreenState();
}

class _HoroscopeBodyScreenState extends State<HoroscopePage> {
  String? textLove;
  String? textCommon;
  String? textBusiness;

  @override
  void initState() {
    textLove = horoService.state
        .getHoroBySign(widget.sign.sign.name)
        ?.love
        .getText(widget.day);
    textCommon = horoService.state
        .getHoroBySign(widget.sign.sign.name)
        ?.common
        .getText(widget.day);
    textBusiness = horoService.state
        .getHoroBySign(widget.sign.sign.name)
        ?.bisiness
        .getText(widget.day);
    super.initState();
  }

  // TODO: get api for angles!
  @override
  Widget build(BuildContext context) {
    return HoroscopeBody(
      picture: HoroscopeMainPicture(sign: widget.sign),
      circles: [
        CircleText(
          title: "Love",
          angle: getAngle(widget.sign.sign.name, 0, widget.day),
          color: Colors.red,
        ),
        CircleText(
            title: "Health",
            angle: getAngle(widget.sign.sign.name, 1, widget.day),
            color: Colors.green),
        CircleText(
          title: "Business",
          angle: getAngle(widget.sign.sign.name, 2, widget.day),
          color: Colors.cyan,
        ),
      ],
      content: [
        const IconTitle(
            icon: Icon(Icons.star, color: Colors.cyan), title: "Общий"),
        Horoscopecontent(text: textCommon),
        const IconTitle(
            icon: Icon(Icons.favorite, color: Colors.red), title: "Любовь"),
        Horoscopecontent(text: textLove),
        const IconTitle(
            icon: Icon(Icons.attach_money, color: Colors.yellowAccent),
            title: "Бизнес"),
        Horoscopecontent(text: textBusiness)
      ],
    );
  }
}

double getAngle(String sign, int index, String day) {
  int shift = 0;
  if (day == "yesterday") {
    shift = -1;
  } else if (day == "tomorrow") {
    shift = 1;
  }
  return 144 +
      (360.0 * signsProbability[sign]![index] * (DateTime.now().day + shift) +
              DateTime.now().month * 337) %
          216.0;
}

class HoroscopeMainPicture extends StatefulWidget {
  final ZodiacSign sign;

  const HoroscopeMainPicture({
    Key? key,
    required this.sign,
  }) : super(key: key);

  @override
  State<HoroscopeMainPicture> createState() => _MainCardState();
}

class _MainCardState extends State<HoroscopeMainPicture> {
  late final image = AssetImage(widget.sign.image);

  @override
  void didChangeDependencies() {
    precacheImage(image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      height: 200,
      width: 200,
    );
  }
}
