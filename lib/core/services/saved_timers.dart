import 'dart:convert';
import 'dart:io';

import 'package:exam_time_tracker/features/timer/data/models/timer_data.dart';
import 'package:path_provider/path_provider.dart';

class SavedTimers {
  static final List<TimerData> _timers = [];

  static List<TimerData> get all => List.unmodifiable(_timers);

  static Future<void> load() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/timers.json');
    if (!await file.exists()) return;

    final content = await file.readAsString();
    final List data = jsonDecode(content);
    _timers.clear();
    _timers.addAll(data.map((e) => TimerData.fromJson(e)));
  }

  static Future<void> add(TimerData timer) async {
    _timers.add(timer);
    await save();
  }

  static Future<void> save() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/timers.json');
    await file.writeAsString(jsonEncode(_timers.map((t) => t.toJson()).toList()));
  }
}