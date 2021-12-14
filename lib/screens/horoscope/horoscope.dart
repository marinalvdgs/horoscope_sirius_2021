import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';
import 'package:horoscope_sirius_2021/models/zodiac_sign.dart';

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
              HoroscopeMainPicture(sign: allSigns[0]),
              HoroscopeMainPicture(sign: allSigns[1]),
              DraggableScrollableSheet(
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      ],
                    ),
                  );
                },
              ),

            ],
          ),
        ),
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
    return Container(
      height: 100,
      width: 130,
      transformAlignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Image(
                image: image,
                height: 100,
                width: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

