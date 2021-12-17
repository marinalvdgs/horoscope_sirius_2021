import 'package:flutter/material.dart';
import 'dart:math';

List<FallingStar> STARS = [];
List<SparkleStar> SPARKLE_STARS = [];

double NUMBER_OF_FALLING_STARS = 0.2, NUMBER_OF_SPARKLING_STARS = 0.5;

void process_stars() {
  for (int i = 0; i < STARS.length; i++) {
    if (!STARS[i].fall()) {
      STARS.removeAt(i);
      i -= 1;
    }
  }
  debugPrint(Random().nextDouble().toString());
  if (Random().nextDouble() < NUMBER_OF_FALLING_STARS) {
    STARS.add(FallingStar());
  }

  for (int i = 0; i < SPARKLE_STARS.length; i++) {
    if (!SPARKLE_STARS[i].sparkle()) {
      SPARKLE_STARS.removeAt(i);
      i -= 1;
    }
  }
  debugPrint(Random().nextDouble().toString());
  if (Random().nextDouble() < NUMBER_OF_SPARKLING_STARS) {
    SPARKLE_STARS.add(SparkleStar());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
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
    var r = 170;
    var g = 170;
    var b = 170;

    return Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  process_stars();
                  return CustomPaint(
                    painter: MyPainter(),
                  );
                },
              ),
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Image.asset(
                  "horo_circle.png",
                  width: 300,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[900]);
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

    SPARKLE_STARS.forEach((star) => canvas.drawCircle(Offset(star.x, star.y), 2,
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
  double velocity = Random().nextDouble() * 16 + 8;
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
  double alpha = 0;
  double step = 0.02;
  bool increasing = true;

  SparkleStar();

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
