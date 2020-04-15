import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:wave_pomodoro_timer/app_colors.dart';

class Waves extends StatelessWidget {
  const Waves(this.anim, {Key key}) : super(key: key);

  final double anim;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        AnimatedWave(
          height: 70,
          speed: 1.0,
          color: AppColors.color3.withOpacity(0.75),
          anim: anim,
        ),
        AnimatedWave(
          height: 65,
          speed: 0.8,
          color: AppColors.color2.withOpacity(0.75),
          offset: pi,
          anim: anim,
        ),
        AnimatedWave(
          height: 60,
          speed: 0.7,
          color: AppColors.color1,
          offset: pi / 2,
          anim: anim,
        ),
      ],
    );
  }
}

class AnimatedWave extends StatelessWidget {
  AnimatedWave({
    this.height,
    this.speed,
    this.color,
    this.anim,
    this.offset = 0.0,
  });
  final double height;
  final double speed;
  final double offset;
  final Color color;
  final double anim;

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
          builder: (context, value) => CustomPaint(
            foregroundPainter: CurvePainter(value + offset, color, anim),
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  CurvePainter(this.value, this.color, this.anim);
  final double value;
  final Color color;
  final double anim;

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = color;
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1) - 50.0 - anim;
    final controlPointY = size.height * (0.5 + 0.4 * y2) - 50.0 - anim;
    final endPointY = size.height * (0.5 + 0.4 * y3) - 50.0 - anim;

    path.moveTo(0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
