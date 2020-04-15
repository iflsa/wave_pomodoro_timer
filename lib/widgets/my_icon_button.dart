import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    Key key,
    this.onTap,
    this.firstChild,
    this.secondChild,
    this.fade,
  }) : super(key: key);

  final Function onTap;
  final Widget firstChild;
  final Widget secondChild;
  final bool fade;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25.0),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            child: AnimatedCrossFade(
              firstChild: SizedBox(width: 25, height: 25, child: firstChild),
              secondChild: SizedBox(width: 25, height: 25, child: secondChild),
              duration: Duration(milliseconds: 250),
              crossFadeState:
                  fade ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
          ),
        ),
      ),
    );
  }
}
