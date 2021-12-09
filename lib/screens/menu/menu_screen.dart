import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/models/option.dart';

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {

  return ListView.builder(
    physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics()),
    itemCount: options.length,
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.all(30),
        height: 100,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: new LinearGradient(
            colors: [
              Color(0xFF010630),
              Color(0xFF071345),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.25, 0.90],
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Color(0xFF101012),
          //     offset: Offset(-12, 12),
          //     blurRadius: 8,
          //   ),
          // ],
        ),
          // elevation: 10,//                   <-- Card widget
          child: ListTile(
            trailing: Image.asset("assets/images/scales.jpg"),
            title: Text(options[index].title),
          ),
      );
      // return Card(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15.0),
      //   ),//
      //   elevation: 10,//                   <-- Card widget
      //   child: ListTile(
      //     leading: Image.asset("assets/images/scales.jpg"),
      //     title: Text(options[index].title),
      //   ),
      //   margin: EdgeInsets.fromLTRB(20, 20, 10, 10),
      //   color: Color(0xFF010630)
      // );
    },
  );
}