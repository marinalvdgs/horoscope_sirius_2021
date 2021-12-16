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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image(image: leftImage)),
          const SizedBox(width: 16),
          Expanded(
            child: Transform(
              transform:
                  Matrix4.rotationY(widget.left == widget.right ? pi : 0),
              alignment: Alignment.center,
              child: Image(image: rightImage),
            ),
          ),
        ],
      ),
    );
  }
}
