import 'package:flutter/material.dart';
import 'package:wave_pomodoro_timer/app_colors.dart';
import 'package:wave_pomodoro_timer/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.color4,
      ),
      home: Home(),
    );
  }
}
