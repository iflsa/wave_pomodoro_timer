import 'package:flutter/material.dart';
import 'package:wave_pomodoro_timer/app_colors.dart';
import 'package:wave_pomodoro_timer/pages/home_page.dart';
import 'package:wave_pomodoro_timer/pages/settings_page.dart';
import 'package:wave_pomodoro_timer/pages/statistics_page.dart';
import 'package:wave_pomodoro_timer/res/images.dart';
import 'package:wave_pomodoro_timer/widgets/bottom_nav_bar.dart';
import 'package:wave_pomodoro_timer/widgets/show_up.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController(initialPage: 1);
  int _pageNum = 1;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      print("dsddf");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Container for pages
          Container(
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
          // Container(
          //   height: 100.0,
          //   width: 250,
          //   color: AppColors.color1,
          //   child: Text("Animation"),
          // ),

          /// UI elements container
          BottomNavBar(pageNum: _pageNum, pageController: _pageController),
        ],
      ),
    );
  }
}
