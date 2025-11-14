import 'package:exam_time_tracker/app/app.dart';
import 'package:exam_time_tracker/core/state/current_state.dart';
import 'package:exam_time_tracker/core/localization/locale_provider.dart';
import 'package:exam_time_tracker/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => CurrentState()),
      ],
      child: const MyApp(),
    )
  );
}
