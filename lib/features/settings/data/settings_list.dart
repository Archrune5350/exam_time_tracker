import 'package:exam_time_tracker/core/constants/app_strings.dart';
import 'package:exam_time_tracker/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsList {
  final String group;
  final String name;
  final Icon icon;
  final VoidCallback? onTap;
  final Widget? option;

  SettingsList({required this.group, required this.name, required this.icon, this.onTap, this.option,});
}

enum SettingKey {
  themeSwitch,
  language,
}

Map<SettingKey, SettingsList> buildSettingsMap(BuildContext context) {
  final strings = SettingsStrings(context);
  final themeProvider = Provider.of<ThemeProvider>(context);

  return {
    SettingKey.themeSwitch: SettingsList(
      group: strings.appearance, 
      name: strings.darkMode, 
      icon: Icon(Icons.dark_mode),
      option: Switch(
        value: themeProvider.isDarkMode, 
        onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
      ),
    ),

    SettingKey.language: SettingsList(
      group: strings.language, 
      name: strings.languages,
      icon: Icon(Icons.language),
      option: Icon(
        Icons.arrow_forward
      ),
    ),
  };
}