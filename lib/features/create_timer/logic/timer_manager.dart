
import 'package:exam_time_tracker/core/services/saved_timers.dart';
import 'package:exam_time_tracker/features/timer/data/models/timer_data.dart';
import 'package:uuid/uuid.dart';

class TimerManager {
  void saveTimer({
    required String name,
    required bool isGroup,
    required List<String> members,
    required String examTime,
  }) {
    final timer = TimerData(
      id: const Uuid().v4(),
      name: name, 
      isGroup: isGroup, 
      members: members, 
      examTime: examTime, 
      createdAt: DateTime.now(),
      laps: [],
    );

    SavedTimers.add(timer);
  }
}