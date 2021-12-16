import 'package:flutter/material.dart';
import 'package:horoscope_sirius_2021/common/style.dart';
import 'package:horoscope_sirius_2021/common_widgets/space_page.dart';

/// Placeholder for loader.dart
class MagicLoader extends StatelessWidget {
  const MagicLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacePage(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: darkBackgroundColor),
          child: const CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
