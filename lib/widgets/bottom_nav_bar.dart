import 'package:flutter/material.dart';
import 'package:wave_pomodoro_timer/app_colors.dart';
import 'package:wave_pomodoro_timer/res/images.dart';
import 'package:wave_pomodoro_timer/widgets/my_icon_button.dart';
import 'package:wave_pomodoro_timer/widgets/my_text_button.dart';
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
        height: 70.0,
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyIconButton(
              firstChild: Image(image: AssetImage(Images.arrowLeft)),
              secondChild: Image(image: AssetImage(Images.statistics)),
              fade: pageNum == 0,
              onTap: () => pageController.animateToPage(
                pageNum == 0 ? 1 : 0,
                duration: Duration(milliseconds: 250),
                curve: Curves.ease,
              ),
            ),
            MyTextButton(
              text: Text("start"),
              onTap: () {},
            ),
            MyIconButton(
              firstChild: Image(image: AssetImage(Images.arrowRight)),
              secondChild: Image(image: AssetImage(Images.settings)),
              fade: pageNum == 2,
              onTap: () => pageController.animateToPage(
                pageNum == 2 ? 1 : 2,
                duration: Duration(milliseconds: 250),
                curve: Curves.ease,
              ),
            )
          ],
        ),
      ),
    );
  }
}
