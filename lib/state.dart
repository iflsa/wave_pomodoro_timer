import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int _sessionTime = 25;
  get sessionTime => _sessionTime;
  set sessionTime(double v) {
    _sessionTime = v.toInt();
    notifyListeners();
  }

  int _shortBreakTime = 5;
  get shortBreakTime => _shortBreakTime;
  set shortBreakTime(double v) {
    _shortBreakTime = v.toInt();
    notifyListeners();
  }

  int _longBreakTime = 30;
  get longBreakTime => _longBreakTime;
  set longBreakTime(double v) {
    _longBreakTime = v.toInt();
    notifyListeners();
  }

  int _shortBreaks = 3;
  get shortBreaks => _shortBreaks;
  set shortBreaks(double v) {
    _shortBreaks = v.toInt();
    notifyListeners();
  }

  bool _showNotifications = true;
  get showNotifications => _showNotifications;
  set showNotifications(bool v) {
    _showNotifications = v;
    notifyListeners();
  }

  bool _muteSound = false;
  get muteSound => _muteSound;
  set muteSound(bool v) {
    _muteSound = v;
    notifyListeners();
  }
}
