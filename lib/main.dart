import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave_pomodoro_timer/app_colors.dart';
import 'package:wave_pomodoro_timer/home.dart';
import 'package:wave_pomodoro_timer/state.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wave Pomodoro Timer',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.color4,
        accentColor: AppColors.color1,
      ),
      home: Home(),
    );
  }
}
