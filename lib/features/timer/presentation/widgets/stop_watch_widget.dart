import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchWidget extends StatefulWidget {
  final bool groupEnabled; // Om gruppetilstand er slået til
  final List<String> groupMembers; // Liste over medlemmer (navne)

  const StopwatchWidget({
    super.key,
    required this.groupEnabled,
    this.groupMembers = const [],
  });

  @override
  State<StopwatchWidget> createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  // Hoved-stopuret (for hele gruppen)
  late Stopwatch _mainStopwatch;

  // Timer der opdaterer UI’et løbende
  late Timer _timer;

  // Et stopur pr. medlem, gemt i et map
  final Map<String, Stopwatch> _memberStopwatches = {};

  // Navn på det aktive medlem (hvis nogen)
  String? _activeMember;

  /// Kaldes når man trykker på et medlemsknap
  void _toggleMember(String member) {
    setState(() {
      // Hvis der allerede er et aktivt medlem, stop dets stopwatch
      if (_activeMember != null && _activeMember != member) {
        _memberStopwatches[_activeMember!]?.stop();
      }

      // Start hovedstopuret, hvis det ikke kører
      if (!_mainStopwatch.isRunning) {
        _mainStopwatch.start();
      }

      // Start nyt medlems-stopur (det samme medlem igen gør ikke noget nu)
      _memberStopwatches[member]?.start();

      // Opdater aktivt medlem
      _activeMember = member;
    });
  }

  @override
  void initState() {
    super.initState();

    // Opret hovedstopuret
    _mainStopwatch = Stopwatch();

    // Kør _updateTime() hvert 100 ms for at opdatere visningen
    _timer = Timer.periodic(const Duration(milliseconds: 100), _updateTime);

    // Opret stopure for hvert medlem, hvis gruppe er aktiveret
    if (widget.groupEnabled && widget.groupMembers.isNotEmpty) {
      for (var member in widget.groupMembers) {
        _memberStopwatches[member] = Stopwatch();
      }
    }
  }

  @override
  void didUpdateWidget(covariant StopwatchWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Hvis gruppen ændrer sig (nye medlemmer)
    if (widget.groupMembers != oldWidget.groupMembers) {
      for (var m in widget.groupMembers) {
        // Tilføj stopur for eventuelle nye medlemmer
        _memberStopwatches.putIfAbsent(m, () => Stopwatch());
      }
    }
  }

  /// Opdaterer UI’et løbende, hvis et af stopurene kører
  void _updateTime(Timer timer) {
    if (_mainStopwatch.isRunning ||
        _memberStopwatches.values.any((sw) => sw.isRunning)) {
      setState(() {}); // Trigger UI-opdatering
    }
  }

  /// Formatterer tid som HH:MM:SS
  String _formatTime(int milliseconds) {
    final seconds = (milliseconds / 1000).floor();
    final minutes = (seconds / 60).floor();
    final hours = (minutes / 60).floor();

    final formattedHours = hours.toString().padLeft(2, '0');
    final formattedMinutes = (minutes % 60).toString().padLeft(2, '0');
    final formattedSeconds = (seconds % 60).toString().padLeft(2, '0');

    return "$formattedHours:$formattedMinutes:$formattedSeconds";
  }

  /// Stopper hele gruppen og hovedtimeren
  void _stopAll() {
    setState(() {
      _mainStopwatch.stop();
      for (var sw in _memberStopwatches.values) {
        sw.stop();
      }
      _activeMember = null;
    });
  }

  /// Nulstiller hele gruppen og hovedtimeren
  void _resetAll() {
    setState(() {
      _mainStopwatch.reset();
      for (var sw in _memberStopwatches.values) {
        sw.reset();
      }
      _activeMember = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tid for hovedstopuret
    final elapsed = _mainStopwatch.elapsedMilliseconds;
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Viser hovedtimeren øverst
        Text(
          _formatTime(elapsed),
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        // Hvis gruppetilstand er aktiv, vis knapper for hvert medlem
        if (widget.groupEnabled) ...[
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: widget.groupMembers.map((member) {
              final memberWatch = _memberStopwatches[member];
              final elapsed = memberWatch?.elapsedMilliseconds ?? 0;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Knap for medlemmet
                  ElevatedButton(
                    onPressed: () => _toggleMember(member),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _activeMember == member
                          ? theme.colorScheme.secondary
                          : null
                    ),
                    child: Text(member),
                  ),
                  const SizedBox(height: 4),
                  // Tidsvisning for medlemmet
                  Text(
                    _formatTime(elapsed),
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              );
            }).toList(),
          ),
        ],

        // Hvis ikke gruppetilstand, vis almindelige knapper
        if (!widget.groupEnabled) ...[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _mainStopwatch.isRunning
                    ? null
                    : () => setState(() => _mainStopwatch.start()),
                child: const Text("Start"),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _mainStopwatch.isRunning
                    ? () => setState(() => _mainStopwatch.stop())
                    : null,
                child: const Text("Stop"),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => setState(() => _mainStopwatch.reset()),
                child: const Text("Reset"),
              ),
            ],
          ),
        ],

        const SizedBox(height: 30),

        // Fælles stop-knap der stopper ALT
        ElevatedButton(
          onPressed: _stopAll,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          ),
          child: const Text(
            "Stop alle",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),

        ElevatedButton(
          onPressed: _resetAll,
          child: const Text("Reset all"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Stop timeren når widget destrueres
    _timer.cancel();
    super.dispose();
  }
}