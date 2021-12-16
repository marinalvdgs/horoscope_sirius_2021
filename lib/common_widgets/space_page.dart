import 'dart:math';

import 'package:flutter/material.dart';

/// Use this widget to wrap every page in app to make space background
class SpacePage extends StatelessWidget {
  final Widget body;
  const SpacePage({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF1F0660),
              Color(0xFF0E0054),
              Color(0xFF210535),
            ],
            transform: GradientRotation(pi / 2),
          ),
          image: DecorationImage(
            image: const AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                const Color(0xFF210535).withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child:
            SizedBox(height: MediaQuery.of(context).size.height, child: body),
      ),
    );
  }
}
