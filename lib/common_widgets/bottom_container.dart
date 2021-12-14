import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final Widget child;
  const BottomContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white.withOpacity(0.2),
      ),
      child: child,
    );
  }
}
