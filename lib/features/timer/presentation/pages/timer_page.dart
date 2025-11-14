import 'package:exam_time_tracker/features/timer/data/models/timer_data.dart';
import 'package:exam_time_tracker/features/timer/presentation/widgets/stop_watch_widget.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  final TimerData timerData;

  const TimerPage({super.key, required this.timerData});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  TimerData get timer => widget.timerData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(timer.name),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          StopwatchWidget(groupEnabled: timer.isGroup, groupMembers: timer.members),
        ],
      ),
    );
  }
}