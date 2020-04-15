import 'package:flutter/material.dart';

import '../app_colors.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key key,
    this.onTap,
    this.text,
  }) : super(key: key);

  final Function onTap;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25.0),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            child: DefaultTextStyle(
              style: TextStyle(
                fontFamily: "Comfortaa-Bold",
                fontSize: 24.0,
                color: AppColors.color4,
              ),
              child: text,
            ),
          ),
        ),
      ),
    );
  }
}
