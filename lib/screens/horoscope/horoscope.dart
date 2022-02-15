import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horoscope_sirius_2021/common_widgets/circle_text.dart';
import 'package:horoscope_sirius_2021/common_widgets/icon_title.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/services/horoscope_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../common_widgets/horoscope_content.dart';
import '../../models/full_horo.dart';

class HoroscopeScreen extends StatefulWidget {
  final ZodiacSign sign;

  const HoroscopeScreen({Key? key, required this.sign}) : super(key: key);

  @override
  _HoroscopeScreenState createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> with SingleTickerProviderStateMixin {

  String currentDay = "yesterday";

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          currentDay = "yesterday";
          break;
        case 1:
          currentDay = "today";
          break;
        case 2:
          currentDay = "tomorrow";
          break;
      }
    }
  }

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
              title: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: "Вчера"),
                  Tab(text: "Сегодня"),
                  Tab(text: "Завтра"),
                ],
              ),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                    onTap: () async {
                      final bytes = await rootBundle.load(widget.sign.image);
                      final list = bytes.buffer.asUint8List();
                      final directory = (await getTemporaryDirectory()).path;
                      File imgFile = File('$directory/t.png');
                      imgFile.writeAsBytesSync(list);

                      // TODO: COPY PASTE
                      FullHoro? horo = horoService.state.getHoroBySign(widget.sign.sign.name);
                      String? textLove = horo?.love.getText(currentDay);
                      String? textCommon = horo?.health.getText(currentDay);
                      String? textBusiness = horo?.bisiness.getText(currentDay);

                      Share.shareFiles(['$directory/t.png'],
                          text: "\"Здоровье\":\n\n" + ((textCommon != null) ? textCommon : "") + "\n\n"
                          + "\"Любовь\":\n\n" + ((textLove != null) ? textLove : "") + "\n\n"
                          + "\"Бизнес\"\n\n" + ((textBusiness != null) ? textBusiness : ""));
                    },
                    child: Icon(
                      Icons.share,
                      size: 26.0,
                    ),
                  ),
                ),
              ]),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: HoroscopeMainPicture(sign: widget.sign),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,

                  children: [
                    HoroscopePage(sign: widget.sign, day: "yesterday"),
                    HoroscopePage(sign: widget.sign, day: "today"),
                    HoroscopePage(sign: widget.sign, day: "tomorrow"),
                  ],
                ),
              ),
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

  HoroscopePage({Key? key, required this.sign, required this.day})
      : super(key: key) {
  }

  @override
  _HoroscopeBodyScreenState createState() => _HoroscopeBodyScreenState();
}

class _HoroscopeBodyScreenState extends State<HoroscopePage> {
  String? textLove;
  String? textCommon;
  String? textBusiness;

  @override
  void initState() {
    FullHoro? horo = horoService.state.getHoroBySign(widget.sign.sign.name);
    textLove = horo?.love.getText(widget.day);
    textCommon = horo?.common.getText(widget.day);
    textBusiness = horo?.bisiness.getText(widget.day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      HoroscopeContent(
        circles: [
          CircleText(
              title: "Здоровье",
              angle: getAngle(widget.sign.sign.name, 1, widget.day),
              color: Colors.green),
          CircleText(
            title: "Любовь",
            angle: getAngle(widget.sign.sign.name, 0, widget.day),
            color: Colors.red,
          ),

          CircleText(
            title: "Бизнес",
            angle: getAngle(widget.sign.sign.name, 2, widget.day),
            color: Colors.cyan,
          ),
        ],
        content: [
          const IconTitle(
              icon: Icon(Icons.star, color: Colors.cyan), title: "Здоровье"),
          Horoscopecontent(text: textCommon),
          const IconTitle(
              icon: Icon(Icons.favorite, color: Colors.red), title: "Любовь"),
          Horoscopecontent(text: textLove),
          const IconTitle(
              icon: Icon(Icons.attach_money, color: Colors.yellowAccent),
              title: "Бизнес"),
          Horoscopecontent(text: textBusiness)
        ],
      )
    ]);
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
