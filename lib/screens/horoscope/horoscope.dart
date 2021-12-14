import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/common_widgets/bottom_container.dart';
import 'package:horoscope_sirius_2021/common_widgets/loader_horo.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/models/horo.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';
import 'package:horoscope_sirius_2021/services/horoscope_service.dart';

class HoroscopeScreen extends StatefulWidget {
  const HoroscopeScreen({Key? key}) : super(key: key);

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
              HoroscopeBody(sign: allSigns[0]),
              HoroscopeBody(sign: allSigns[0]),
              HoroscopeBody(sign: allSigns[0]),
            ],
          ),
        ),
      ),
    );
  }
}

class HoroscopeBody extends StatefulWidget {
  final ZodiacSign sign;

  const HoroscopeBody({Key? key, required this.sign}) : super(key: key);

  @override
  _HoroscopeBodyScreenState createState() => _HoroscopeBodyScreenState();
}

class _HoroscopeBodyScreenState extends State<HoroscopeBody> {
  String textLove = "";
  String textCommon = "";
  String textBusiness = "";

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          return Column(children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: HoroscopeMainPicture(sign: allSigns[0]),
            ),
            Expanded(
              child: BottomContainer(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleText(
                          title: "Love",
                          angle: 210,
                          color: Colors.red,
                        ),
                        CircleText(
                          title: "Health",
                          angle: 185,
                          color : Colors.green
                        ),
                        CircleText(title: "Business", angle: 360, color: Colors.cyan,),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                horoService.state.getHoroBySign(allSigns[1].sign)?.love.today ?? "",
                                style: buttonTextStyle.copyWith(fontSize: 14),
                              ),
                              Text(
                                  horoService.state.getHoroBySign(allSigns[1].sign)?.common.today ?? "",
                                  style: buttonTextStyle.copyWith(fontSize: 14)),
                              Text(
                                  horoService.state.getHoroBySign(allSigns[1].sign)?.bisiness.today ?? "",
                                  style: buttonTextStyle.copyWith(fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          );
        });
  }
}

class CircleText extends StatelessWidget {
  final String title;
  final double angle;
  final Color color;

  const CircleText({Key? key, required this.title, required this.angle, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: headerMenuStyle.copyWith(
                  fontSize: 16,
                ),
              )),
              Container(
                height: 60,
                width: 60,
                child: CustomPaint(foregroundPainter: ArcPainter(angle: angle, color: color),
                  child: Center(child:Text((angle / 360.0 * 100).toInt().toString(),
                      style: buttonTextStyle.copyWith(fontSize: 18))),
                ),
              ),
        ],
      ),
    );
  }
}

class HoroscopeMainPicture extends StatefulWidget {
  final ZodiacSign sign;

  const HoroscopeMainPicture({
    Key? key,
    required this.sign,
  }) : super(key: key);

  @override
  State<HoroscopeMainPicture> createState() => _SignCardState();
}

class _SignCardState extends State<HoroscopeMainPicture> {
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
