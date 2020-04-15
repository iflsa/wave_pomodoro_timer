import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:wave_pomodoro_timer/widgets/chart.dart';
import 'package:wave_pomodoro_timer/widgets/my_title.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyTitle("Statistics"),
          Container(
            height: MediaQuery.of(context).size.width * 0.9, //Might fix later
            child: Chart(
              [
                ["Monday", 15],
                ["Tuesday", 15],
                ["Wednesday", 15],
                ["Thursday", 15],
                ["Friday", 15],
                ["Saturday", 15],
                ["Sunday", 15],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
