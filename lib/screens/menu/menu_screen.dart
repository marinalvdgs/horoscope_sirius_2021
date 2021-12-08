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
      return Card( //
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),//
        elevation: 10,//                   <-- Card widget
        child: ListTile(
          leading: Image.asset("assets/images/scales.jpg"),
          title: Text(options[index].title),
        ),
        margin: EdgeInsets.fromLTRB(20, 20, 10, 10),
      );
    },
  );
}