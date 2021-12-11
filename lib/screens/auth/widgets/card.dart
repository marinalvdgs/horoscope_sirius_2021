import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_sirius_2021/models/option.dart';

class CardInstance extends StatelessWidget {
  final Option option;

  const CardInstance({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF010630),
                Color(0xFF071345),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.25, 0.90],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.deepPurple,
                blurRadius: 3,
              ),
            ],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => debugPrint("hello"),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 10, 10, 10),
                                child: Text(option.title,
                                    style: GoogleFonts.ubuntuMono(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      letterSpacing: 2,
                                      color: Colors.white,
                                      fontSize: 26,
                                    )))),
                        FittedBox(
                          fit: BoxFit.none,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: option.image),
                        )
                      ]),
                ),
              )),
        ),
      ),
    );
  }
}
