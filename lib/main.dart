import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

List<Star> STARS = [];

void process_stars() {
  for (int i = 0; i < STARS.length; i++) {
    if (!STARS[i].fall()) {
      STARS.removeAt(i);
      i -= 1;
    }
  }
  debugPrint(Random().nextDouble().toString());
  if (Random().nextDouble() > 0.95) {
    STARS.add(Star());
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
                  debugPrint("1111");
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

    canvas.drawCircle(c - Offset(0, 0), 0, whitePaint);

    STARS.forEach((star) => drawStar(canvas, star, whitePaint));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

void drawStar(Canvas canvas, Star star, Paint paint) {
  canvas.drawCircle(Offset(star.x, star.y), 2, paint);
  canvas.drawLine(
      Offset(star.x, star.y),
      Offset(star.x - 5 * star.velocity * cos(star.angle),
          star.y - 5 * star.velocity * sin(star.angle)),
      paint);
}

class Star {
  double x = Random().nextDouble() * 800;
  double y = Random().nextDouble() * 800;
  double velocity = Random().nextDouble() * 16 + 8;
  double angle = Random().nextDouble() * 2 * pi;
  double counter = 0;

  Star();

  fall() {
    counter++;
    y += velocity * sin(angle);
    x += velocity * cos(angle);

    if (counter > 45) return false;
    return true;
  }
}
