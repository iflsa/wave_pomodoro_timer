import 'package:flutter/material.dart';
import 'package:wave_pomodoro_timer/home.dart';

import 'consts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
