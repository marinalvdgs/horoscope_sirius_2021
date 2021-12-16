import 'dart:math';

import 'package:flutter/material.dart';

class CompatibilityImage extends StatefulWidget {
  final String left;
  final String right;

  const CompatibilityImage({
    Key? key,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  State<CompatibilityImage> createState() => _CompatibilityImageState();
}

class _CompatibilityImageState extends State<CompatibilityImage> {
  late final leftImage = AssetImage(widget.left);
  late final rightImage = AssetImage(widget.right);

  @override
  void didChangeDependencies() {
    precacheImage(leftImage, context);
    precacheImage(rightImage, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Row(
        children: [
          Image(image: leftImage, height: 150),
          Image(image: rightImage, height: 150),
        ],
      ),
    );
  }
}
