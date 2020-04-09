import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:wave_pomodoro_timer/app_colors.dart';
// import 'package:simple_animations_example_app/widgets/example_page.dart';

class Waves extends StatelessWidget {
  const Waves({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        AnimatedWave(
          height: 50,
          speed: 1.0,
          color: AppColors.color3,
        ),
        AnimatedWave(
          height: 45,
          speed: 0.8,
          color: AppColors.color2,
          offset: pi,
        ),
        AnimatedWave(
          height: 40,
          speed: 0.7,
          color: AppColors.color1,
          offset: pi / 2,
        ),
      ],
    );
  }

  onBottom(Widget child) => Positioned(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}

class AnimatedWave extends StatelessWidget {
  AnimatedWave({
    this.height,
    this.speed,
    this.color,
    this.offset = 0.0,
  });
  final double height;
  final double speed;
  final double offset;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: height,
        width: constraints.biggest.width,
        child: ControlledAnimation(
            playback: Playback.LOOP,
            duration: Duration(milliseconds: (5000 / speed).round()),
            tween: Tween(begin: 0.0, end: 2 * pi),
            builder: (context, value) {
              return CustomPaint(
                foregroundPainter: CurvePainter(value + offset, color),
              );
            }),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double value;
  final Color color;

  CurvePainter(this.value, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = color;
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
