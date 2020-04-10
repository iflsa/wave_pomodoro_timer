import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave_pomodoro_timer/state.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.red,
        ),
        child: Column(
          children: <Widget>[
            Text(
              "BIG",
              style: TextStyle(fontSize: 50.0),
            ),
            Text(
              "smol",
              style: TextStyle(fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
