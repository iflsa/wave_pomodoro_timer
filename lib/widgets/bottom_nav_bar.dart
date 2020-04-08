import 'package:flutter/material.dart';
import 'package:wave_pomodoro_timer/app_colors.dart';
import 'package:wave_pomodoro_timer/res/images.dart';
import 'package:wave_pomodoro_timer/widgets/show_up.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({this.pageNum, this.pageController, Key key})
      : super(key: key);

  final int pageNum;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return ShowUp(
      delay: 500,
      child: Container(
        color: AppColors.color1,
        height: 70.0,
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStatisticsButton(),
            _buildMainButton(),
            _buildSettingsButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsButton() {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(50.0),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          pageController.animateToPage(
            pageNum == 0 ? 1 : 0,
            duration: Duration(milliseconds: 250),
            curve: Curves.ease,
          );
        },
        child: Container(
          width: 25.0,
          height: 25.0,
          margin: EdgeInsets.all(10.0),
          child: AnimatedCrossFade(
            firstChild: Image(
              image: AssetImage(Images.arrowLeft),
            ),
            secondChild: Image(
              image: AssetImage(Images.statistics),
            ),
            duration: Duration(milliseconds: 250),
            crossFadeState: pageNum == 0
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }

  Widget _buildMainButton() {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(50.0),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          pageController.animateToPage(
            pageNum == 0 ? 1 : 0,
            duration: Duration(milliseconds: 250),
            curve: Curves.ease,
          );
        },
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Center(child: Text("TODO YET")),
        ),
      ),
    );
  }

  Material _buildSettingsButton() {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(50.0),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          pageController.animateToPage(
            pageNum == 2 ? 1 : 2,
            duration: Duration(milliseconds: 250),
            curve: Curves.ease,
          );
        },
        child: Container(
          width: 25.0,
          height: 25.0,
          margin: EdgeInsets.all(10.0),
          child: AnimatedCrossFade(
            firstChild: Image(
              image: AssetImage(Images.arrowRight),
            ),
            secondChild: Image(
              image: AssetImage(Images.settings),
            ),
            duration: Duration(milliseconds: 250),
            crossFadeState: pageNum == 2
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}
