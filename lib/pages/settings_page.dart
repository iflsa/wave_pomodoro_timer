import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave_pomodoro_timer/app_colors.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _session_time = 25.0;
  double _short_break_time = 5.0;
  double _long_break_time = 30.0;
  double _short_breaks = 3.0;
  bool _show_notifications = true;
  bool _mute_sound = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Settings",
                style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 50.0,
                ),
              ),
            ),
            _buildSlider(
              text: "Session Time:",
              value: _session_time,
              setValue: (val) => setState(() {
                _session_time = val;
              }),
            ),
            _buildSlider(
              text: "Short Break Time:",
              value: _short_break_time,
              setValue: (val) => setState(() {
                _short_break_time = val;
              }),
            ),
            _buildSlider(
              text: "Long Break Time:",
              value: _long_break_time,
              setValue: (val) => setState(() {
                _long_break_time = val;
              }),
            ),
            _buildSlider(
              text: "Long Break Per:",
              value: _short_breaks,
              setValue: (val) => setState(() {
                _short_breaks = val;
              }),
            ),
            _buildSwitch(
              text: "Show Notifications:",
              value: _show_notifications,
              setValue: (val) => setState(
                () {
                  _show_notifications = val;
                },
              ),
            ),
            _buildSwitch(
              text: "Mute Sound:",
              value: _mute_sound,
              setValue: (val) => setState(
                () {
                  _mute_sound = val;
                },
              ),
            ),
            Center(
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50.0),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () async {
                    const url =
                        'https://github.com/miloszratajczyk/wave_pomodoro_timer';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "source",
                      style: TextStyle(
                          fontFamily: "Comfortaa-Bold",
                          fontSize: 24.0,
                          color: AppColors.color1),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider({String text, double value, Function setValue}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(fontFamily: "Comfortaa", fontSize: 24.0),
              ),
              Text(
                (value ~/ 1).toString(),
                style: TextStyle(fontFamily: "Comfortaa-Bold", fontSize: 24.0),
              ),
            ],
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.color1,
            inactiveTrackColor: AppColors.color3,
            trackHeight: 5.0,
            thumbColor: AppColors.color1,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
          ),
          child: Slider(
            value: value,
            min: 1,
            max: 60,
            onChanged: setValue,
          ),
        ),
      ],
    );
  }

  Widget _buildSwitch({String text, bool value, Function setValue}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(fontFamily: "Comfortaa", fontSize: 24.0),
              ),
              Switch(
                value: value,
                onChanged: setValue,
                activeColor: AppColors.color1,
                activeTrackColor: AppColors.color2,
                inactiveThumbColor: AppColors.color2,
                inactiveTrackColor: AppColors.color3,
              )
            ],
          ),
        ),
      ],
    );
  }
}
