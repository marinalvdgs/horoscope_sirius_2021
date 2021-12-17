import 'package:flutter/material.dart';
import 'dart:math';

import 'common_widgets/magic_loader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
