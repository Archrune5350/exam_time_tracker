class Lap {
  final DateTime timestamp;
  final String duration;

  Lap({required this.timestamp, required this.duration});

  Map<String, dynamic> toJson() => {
    'timestamp' : timestamp.toIso8601String(),
    'duration' : duration,
  };

  factory Lap.fromJson(Map<String, dynamic> json) => Lap(
    timestamp: DateTime.parse(json['timestamp']),
    duration: json['duration'],
  );
}

class TimerData {
  final String id;
  final String name;
  final bool isGroup;
  final List<String> members;
  final String examTime;
  final DateTime createdAt;
  final List<Lap> laps;

  TimerData({
    required this.id,
    required this.name,
    required this.isGroup,
    required this.members,
    required this.examTime,
    required this.createdAt,
    this.laps = const [],
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'isGroup': isGroup,
    'members': members,
    'examTime': examTime,
    'createdAt': createdAt.toIso8601String(),
    'laps': laps.map((l) => l.toJson()).toList(),
  };

  factory TimerData.fromJson(Map<String, dynamic> json) => TimerData(
    id: json['id'],
    name: json['name'],
    isGroup: json['isGroup'],
    members: List<String>.from(json['members']),
    examTime: json['examTime'],
    createdAt: DateTime.parse(json['createdAt']),
    laps: (json['laps'] as List).map((e) => Lap.fromJson(e)).toList(),
  );
}