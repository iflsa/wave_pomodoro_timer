import 'package:flutter/material.dart';

import 'package:wave_pomodoro_timer/app_colors.dart';
import 'package:wave_pomodoro_timer/pages/home_page.dart';
import 'package:wave_pomodoro_timer/pages/settings_page.dart';
import 'package:wave_pomodoro_timer/pages/statistics_page.dart';
import 'package:wave_pomodoro_timer/widgets/bottom_nav_bar.dart';
import 'package:wave_pomodoro_timer/widgets/show_up.dart';
import 'package:wave_pomodoro_timer/widgets/waves.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  PageController _pageController = PageController(initialPage: 1);
  int _pageNum = 1;

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animation = Tween<double>(begin: 0, end: 700.0).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(),

          /// Container for pages
          // AnimatedOpacity(
          //   duration: Duration(seconds: 1),

          //   opacity: animation.status == AnimationStatus.forward ? 0.0 : 1.0,
          //   child: Container(
          //     padding: EdgeInsets.only(bottom: 75.0), //Should change later
          //     child: PageView(
          //       controller: _pageController,
          //       onPageChanged: (pageNum) => setState(() {
          //         _pageNum = pageNum;
          //       }),
          //       children: [
          //         StatisticsPage(),
          //         HomePage(),
          //         SettingsPage(),
          //       ],
          //     ),
          //   ),
          // ),
          if (animation.status != AnimationStatus.forward)
            AnimatedContainer(
              duration: Duration(seconds: 3),
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
            child: Waves(animation.value),
          ),

          /// Bottom UI elements
          BottomNavBar(pageNum: _pageNum, pageController: _pageController),

          ///Debug only
          // RaisedButton(
          //   child: Text("+"),
          //   onPressed: () {
          //     controller.duration = Duration(seconds: 20);
          //     if (animation.status == AnimationStatus.forward)
          //       controller.reverse();
          //     else
          //       controller.forward();
          //   },
          // )
        ],
      ),
    );
  }
}
