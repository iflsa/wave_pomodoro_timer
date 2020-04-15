import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  const MyTitle(this.title, {Key key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "Pacifico",
          fontSize: 50.0,
        ),
      ),
    );
  }
}
