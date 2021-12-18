import 'package:flutter/material.dart';
import 'dart:math';

List<FallingStar> STARS = [];
List<SparkleStar> SPARKLE_STARS = [];

double NUMBER_OF_FALLING_STARS = 0.05, NUMBER_OF_SPARKLING_STARS = 0.9;

void onTapDown(BuildContext context, TapDownDetails details) {
  SPARKLE_STARS.add(SparkleStar.fromCoords(
      details.globalPosition.dx - 250 + Random().nextDouble() * 10,
      details.globalPosition.dy + Random().nextDouble() * 10));
}

void onPanUpdate(BuildContext context, DragUpdateDetails details) {
  SPARKLE_STARS.add(SparkleStar.fromCoords(
      details.globalPosition.dx - 250 + Random().nextDouble() * 10,
      details.globalPosition.dy + Random().nextDouble() * 10));
}

void process_stars() {
  for (int i = 0; i < STARS.length; i++) {
    if (!STARS[i].fall()) {
      STARS.removeAt(i);
      i -= 1;
    }
  }

  if (Random().nextDouble() < NUMBER_OF_FALLING_STARS) {
    STARS.add(FallingStar());
  }

  for (int i = 0; i < SPARKLE_STARS.length; i++) {
    if (!SPARKLE_STARS[i].sparkle()) {
      SPARKLE_STARS.removeAt(i);
      i -= 1;
    }
  }

  if (Random().nextDouble() < NUMBER_OF_SPARKLING_STARS) {
    SPARKLE_STARS.add(SparkleStar());
  }
}

class MagicLoader extends StatefulWidget {
  @override
  _MyLoader createState() => _MyLoader();
}

class _MyLoader extends State<MagicLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 10000),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (TapDownDetails details) => onTapDown(context, details),
        onPanUpdate: (DragUpdateDetails details) =>
            onPanUpdate(context, details),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) {
                    process_stars();
                    return CustomPaint(
                      painter: MyPainter(),
                    );
                  },
                ),
              ),
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Image.asset(
                  "assets/horo_circle_alpha.png",
                  width: 200,
                ),
              ),
            ],
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  // final List<SnowFlake> snowflakes;

  MyPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final c = size.center(Offset.zero);

    final whitePaint = Paint()..color = Colors.yellow.shade50;

    STARS.forEach((star) => drawStar(canvas, star, whitePaint, w, h));

    SPARKLE_STARS.forEach((star) => canvas.drawCircle(
        Offset(star.x, star.y),
        star.radius,
        Paint()..color = Color.fromRGBO(255, 255, 220, star.alpha)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

void drawStar(Canvas canvas, FallingStar star, Paint paint, w, h) {
  canvas.drawCircle(Offset(star.x, star.y), 2, paint);
  canvas.drawLine(
      Offset(star.x, star.y),
      Offset(star.x - 5 * star.velocity * cos(star.angle),
          star.y - 5 * star.velocity * sin(star.angle)),
      paint);
}

class FallingStar {
  double x = Random().nextDouble() * 500 - 250;
  double y = Random().nextDouble() * 800;
  double velocity = Random().nextDouble() * 10 + 5;
  double angle = Random().nextDouble() * pi;
  double counter = 0;

  FallingStar();

  fall() {
    counter++;
    y += velocity * sin(angle);
    x += velocity * cos(angle);

    if (counter > 45) return false;
    return true;
  }
}

class SparkleStar {
  double x = Random().nextDouble() * 500 - 250;
  double y = Random().nextDouble() * 800;
  double radius = Random().nextDouble() * 1 + 0.5;
  double alpha = 0;
  double step = 0.02;
  bool increasing = true;

  SparkleStar();

  SparkleStar.fromCoords(_x, _y) {
    x = _x;
    y = _y;
  }

  sparkle() {
    // ignore: curly_braces_in_flow_control_structures
    if (increasing) {
      if (alpha < 1) {
        alpha += step;
      } else {
        increasing = false;
      }
    } else {
      if (alpha > 0)
        alpha -= step;
      else
        return false;
    }

    return true;
  }
}
