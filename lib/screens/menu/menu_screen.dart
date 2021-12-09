import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/models/option.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Astrology Magic",
                textAlign: TextAlign.left,
                style: GoogleFonts.sairaCondensed(
                    textStyle: Theme.of(context).textTheme.headline4,
                    color: Colors.white,
                    fontSize: 40,
                ))
            ),
          Expanded(
              child: Center(child: selectListView(context))
          )
        ]
    );
  }
}

Widget selectListView(BuildContext context) {
  return  ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: options.length,
    itemBuilder: (context, index) {
      return
        Container(
        margin: EdgeInsets.all(10),
        height: 120,
        alignment: Alignment.centerLeft,
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
              // offset: Offset(-1, 1),
              blurRadius: 3,
            ),
          ],
        ),

        // elevation: 10,//                   <-- Card widget
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                  child: Text(options[index].title,
                      style: GoogleFonts.ubuntuMono(
                          textStyle: Theme.of(context).textTheme.headline4,
                          letterSpacing: 3,
                          color: Colors.white,
                          fontSize: 20,
                      )))),
                options[index].image
            ]),
      );
    },
  );
}
