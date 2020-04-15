import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave_pomodoro_timer/app_colors.dart';
import 'package:wave_pomodoro_timer/state.dart';
import 'package:wave_pomodoro_timer/widgets/my_text_button.dart';
import 'package:wave_pomodoro_timer/widgets/my_title.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (ctx, state, child) => Container(
        padding: EdgeInsets.all(5.0),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyTitle("Settings"),
              _buildSlider(
                text: "Session Time:",
                value: state.sessionTime.toDouble(),
                setValue: (val) => state.sessionTime = val,
              ),
              _buildSlider(
                text: "Short Break Time:",
                value: state.shortBreakTime.toDouble(),
                setValue: (val) => state.shortBreakTime = val,
              ),
              _buildSlider(
                text: "Long Break Time:",
                value: state.longBreakTime.toDouble(),
                setValue: (val) => state.longBreakTime = val,
              ),
              _buildSlider(
                text: "Long Break Per:",
                value: state.shortBreaks.toDouble(),
                setValue: (val) => state.shortBreaks = val,
              ),
              _buildSwitch(
                text: "Show Notifications:",
                value: state.showNotifications,
                setValue: (val) => state.showNotifications = val,
              ),
              _buildSwitch(
                text: "Mute Sound:",
                value: state.muteSound,
                setValue: (val) => state.muteSound = val,
              ),
              MyTextButton(
                text: Text(
                  "source",
                  style: TextStyle(
                      fontFamily: "Comfortaa-Bold", color: AppColors.color1),
                ),
                onTap: () async {
                  const url =
                      'https://github.com/miloszratajczyk/wave_pomodoro_timer';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ],
          ),
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
