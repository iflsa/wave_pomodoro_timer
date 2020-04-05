import 'package:flutter/material.dart';
import 'package:wave_pomodoro_timer/pages/home_page.dart';
import 'package:wave_pomodoro_timer/pages/settings_page.dart';
import 'package:wave_pomodoro_timer/pages/statistics_page.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          /// Container for home pages
          Container(
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                Statistics(),
                HomePage(),
                Settings(),
              ],
            ),
          ),

          /// Container for wave animation
          Container(
            height: 64,
            width: double.infinity, //Might delete later
            color: Colors.blue.withOpacity(.5),
            alignment: Alignment.bottomCenter,
            child: Text("Animatin"),
          ),

          /// Container for bottom UI elements
          Container(
            height: 64,
            // TODO: Add UI elements
          )
        ],
      ),
    );
  }
}
