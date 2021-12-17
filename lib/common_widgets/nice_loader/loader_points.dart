import 'package:flutter/material.dart';
import 'dart:math';
import 'dot_type.dart';

class ColorLoaderPoints extends StatefulWidget {
  final Color dotOneColor;
  final Color dotTwoColor;
  final Color dotThreeColor;
  final Duration duration;
  final DotType dotType;
  final Icon dotIcon;

  const ColorLoaderPoints(
      {Key? key,
      this.dotOneColor = Colors.purple,
      this.dotTwoColor = Colors.green,
      this.dotThreeColor = Colors.blueAccent,
      this.duration = const Duration(milliseconds: 1000),
      this.dotType = DotType.circle,
      this.dotIcon = const Icon(Icons.blur_on)})
      : super(key: key);

  @override
  _ColorLoaderPointsState createState() => _ColorLoaderPointsState();
}

class _ColorLoaderPointsState extends State<ColorLoaderPoints>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation_1;
  late Animation<double> animation_2;
  late Animation<double> animation_3;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation_1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.80, curve: Curves.ease),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.9, curve: Curves.ease),
      ),
    );

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 1.0, curve: Curves.ease),
      ),
    );

    controller.addListener(() {
      setState(() {
        //print(animation_1.value);
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform.translate(
          offset: Offset(
            0.0,
            -50 *
                (animation_1.value <= 0.50
                    ? animation_1.value
                    : 1.0 - animation_1.value),
          ),
          child: OneDot(
            widget: widget,
            color: widget.dotOneColor,
          ),
        ),
        Transform.translate(
            offset: Offset(
              0.0,
              -50 *
                  (animation_2.value <= 0.50
                      ? animation_2.value
                      : 1.0 - animation_2.value),
            ),
            child: OneDot(
              widget: widget,
              color: widget.dotTwoColor,
            )),
        Transform.translate(
            offset: Offset(
              0.0,
              -50 *
                  (animation_3.value <= 0.50
                      ? animation_3.value
                      : 1.0 - animation_3.value),
            ),
            child: OneDot(
              widget: widget,
              color: widget.dotThreeColor,
            )),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class OneDot extends StatelessWidget {
  const OneDot({Key? key, required this.widget, required this.color})
      : super(key: key);

  final ColorLoaderPoints widget;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Dot(
        radius: 20.0,
        color: color,
        type: widget.dotType,
        icon: widget.dotIcon,
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;
  final DotType? type;
  final Icon? icon;

  const Dot({Key? key, this.radius, this.color, this.type, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: type == DotType.icon
          ? Icon(
              icon!.icon,
              color: color,
              size: 1.3 * radius!,
            )
          : Transform.rotate(
              angle: type == DotType.diamond ? pi / 4 : 0.0,
              child: Container(
                width: radius,
                height: radius,
                decoration: BoxDecoration(
                    color: color,
                    shape: type == DotType.circle
                        ? BoxShape.circle
                        : BoxShape.rectangle),
              ),
            ),
    );
  }
}
