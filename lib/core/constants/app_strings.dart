import 'package:exam_time_tracker/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

class AppStrings {
  final BuildContext context;
  AppStrings(this.context);

  String get appTitle => AppLocalizations.of(context)!.appTitle;
  String get home => AppLocalizations.of(context)!.home;
  String get settings => AppLocalizations.of(context)!.settings;
  String get history => AppLocalizations.of(context)!.history;
}

class SettingsStrings {
  final BuildContext context;
  SettingsStrings(this.context);

  String get appearance => AppLocalizations.of(context)!.appearance;
  String get darkMode => AppLocalizations.of(context)!.darkMode;
  String get language => AppLocalizations.of(context)!.language;
  String get languages => AppLocalizations.of(context)!.languages;
  String get english => AppLocalizations.of(context)!.english;
  String get spanish => AppLocalizations.of(context)!.spanish;
  String get danish => AppLocalizations.of(context)!.danish;
}

class CreateTimerStrings {
  final BuildContext context;
  CreateTimerStrings(this.context);

  String get createTimer => AppLocalizations.of(context)!.createTimer;
  String get timerName => AppLocalizations.of(context)!.timerName;
  String get groupTimer => AppLocalizations.of(context)!.groupTimer;
  String get groupMembers => AppLocalizations.of(context)!.groupMembers;
  String get name => AppLocalizations.of(context)!.name;
  String get examTime => AppLocalizations.of(context)!.examTime;
  String get time => AppLocalizations.of(context)!.time;
}

class TimerStrings {
  final BuildContext context;
  TimerStrings(this.context);

  String get start => AppLocalizations.of(context)!.start;
  String get stop => AppLocalizations.of(context)!.stop;
  String get reset => AppLocalizations.of(context)!.reset;
  String get stopAll => AppLocalizations.of(context)!.stopAll;
  String get resetAll => AppLocalizations.of(context)!.resetAll;
}