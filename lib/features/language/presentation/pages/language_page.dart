import 'package:exam_time_tracker/core/constants/app_strings.dart';
import 'package:exam_time_tracker/core/localization/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final strings = SettingsStrings(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.language),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(strings.english),
              onTap: () {
                localeProvider.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
          ),
          
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(strings.danish),
              onTap: () {
                localeProvider.setLocale(const Locale('da'));
                Navigator.pop(context);
              },
            ),
          ),

          Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(strings.spanish),
              onTap: () {
                localeProvider.setLocale(const Locale('es'));
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}