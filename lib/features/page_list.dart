import 'package:exam_time_tracker/core/constants/app_strings.dart';
import 'package:exam_time_tracker/features/history/presentation/pages/history_page.dart';
import 'package:exam_time_tracker/features/home/presentation/pages/home_page.dart';
import 'package:exam_time_tracker/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';



class PageProvider {
  final Widget page;
  final String title;
  final Icon icon;

  const PageProvider({required this.page, required this.title, required this.icon});

  static List<PageProvider> pages(BuildContext context) {
    final strings = AppStrings(context);

    return [
      // History page
      PageProvider(page: HistoryPage(), title: strings.history, icon: Icon(Icons.history)),

      // Home page
      PageProvider(page: HomePage(), title: strings.home, icon: Icon(Icons.home)),

      // Settings page
      PageProvider(page: SettingsPage(), title: strings.settings, icon: Icon(Icons.settings)),
    ];
  }
}