import 'package:flutter/material.dart';
import 'package:wave_pomodoro_timer/app_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(32.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: "Pacifico",
              fontSize: 50.0,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Wave",
                style: TextStyle(color: AppColors.color1),
              ),
              TextSpan(
                text: "\nPomodoro\nTimer",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
