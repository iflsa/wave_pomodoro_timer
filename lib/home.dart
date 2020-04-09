import 'package:flutter/material.dart';
import 'package:wave_pomodoro_timer/app_colors.dart';
import 'package:wave_pomodoro_timer/pages/home_page.dart';
import 'package:wave_pomodoro_timer/pages/settings_page.dart';
import 'package:wave_pomodoro_timer/pages/statistics_page.dart';
import 'package:wave_pomodoro_timer/res/images.dart';
import 'package:wave_pomodoro_timer/widgets/bottom_nav_bar.dart';
import 'package:wave_pomodoro_timer/widgets/show_up.dart';
import 'package:wave_pomodoro_timer/widgets/waves.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController(initialPage: 1);
  int _pageNum = 1;

  double _anima = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Container for pages
          Container(
            padding: EdgeInsets.only(bottom: 75.0), //Should change later
            child: PageView(
              controller: _pageController,
              onPageChanged: (pageNum) => setState(() {
                _pageNum = pageNum;
              }),
              children: [
                StatisticsPage(),
                HomePage(),
                SettingsPage(),
              ],
            ),
          ),

          /// Animation container
          ShowUp(
            delay: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Waves(),
                AnimatedContainer(
                  duration: Duration(seconds: 30),
                  height: _anima + 70.0,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.color1,
                ),
              ],
            ),
          ),

          /// Bottom UI elements
          BottomNavBar(pageNum: _pageNum, pageController: _pageController),

          ///Debug only
          // RaisedButton(
          //   child: Text("ANIMA?!?!??!"),
          //   onPressed: () {
          //     setState(() {
          //       _anima = _anima == 0
          //           ? MediaQuery.of(context).size.height - 150.0
          //           : 0;
          //     });
          //   },
          // )
        ],
      ),
    );
  }
}
