import 'package:exam_time_tracker/core/theme/app_theme.light.dart';
import 'package:exam_time_tracker/core/theme/app_theme_dark.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  //initially, light mode
  ThemeData _themeData = light;

  //get current theme
  ThemeData get themeData => _themeData;

  //is dark mode
  bool get isDarkMode => _themeData == dark;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //toggle theme
  void toggleTheme() {
    if (_themeData == light) {
      themeData = dark;
    } else {
      themeData = light;
    }
  }
}