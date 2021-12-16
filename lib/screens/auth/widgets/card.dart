import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/models/option.dart';

class CardInstance extends StatelessWidget {
  final CardOption option;
  final Widget nextScreen;
  final double height;

  const CardInstance(
      {Key? key,
      required this.option,
      required this.nextScreen,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: cardGradient,
            boxShadow: const [
              cardShadow,
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => {
                  debugPrint("TODO: Tap on card:"),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nextScreen),
                  )
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 10, 10),
                              child:
                                  Text(option.title, style: buttonTextStyle))),
                      FittedBox(
                          fit: BoxFit.none,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Image.asset(option.image, height: height),
                          )),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
