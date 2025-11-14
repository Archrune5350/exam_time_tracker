import 'package:exam_time_tracker/l10n/app_localizations.dart';
import 'package:exam_time_tracker/features/base_page.dart';
import 'package:exam_time_tracker/core/localization/locale_provider.dart';
import 'package:exam_time_tracker/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final localeProvider = context.watch<LocaleProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      locale: localeProvider.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: BasePage(),
    );
  }
}