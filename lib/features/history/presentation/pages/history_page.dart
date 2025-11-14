import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('history'),));
  }
}