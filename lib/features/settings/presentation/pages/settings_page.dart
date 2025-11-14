import 'package:exam_time_tracker/shared/widgets/custom_card.dart';
import 'package:exam_time_tracker/features/language/presentation/pages/language_page.dart';
import 'package:exam_time_tracker/features/settings/data/settings_list.dart';
import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //final settingsList = buildSettingsList(context);
    final settingsMap = buildSettingsMap(context);
    final themeSetting = settingsMap[SettingKey.themeSwitch]!;
    final languageSetting = settingsMap[SettingKey.language]!;

    const double spaceBetweenElements = 12.0;
    const double textSpaceFromSides = 16.0;
    const double spaceBetweenGroup = 2.0;

    return ListView(
      children: [
        // Theme setting
        const SizedBox(height: spaceBetweenElements),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: textSpaceFromSides),
          child: Text(themeSetting.group),
        ),

        const SizedBox(height: spaceBetweenGroup),

        CustomCard(
          child: ListTile(
            leading: themeSetting.icon,
            title: Text(themeSetting.name),
            trailing: themeSetting.option,
          ),
        ),
      
        const SizedBox(height: spaceBetweenElements),

        //language Setting
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: textSpaceFromSides),
          child: Text(languageSetting.group),
        ),

        const SizedBox(height: spaceBetweenGroup),

        //language setting
        CustomCard(
          child: ListTile(
            leading: languageSetting.icon,
            title: Text(languageSetting.name),
            trailing: languageSetting.option,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LanguagePage()),
              );
            },
          ),
        ),
      ],
    );
  }
}