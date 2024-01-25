// main.dart
import 'package:flutter/material.dart';
import 'history_manager.dart';
import 'home_page.dart';
import 'settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HistoryManager historyManager = HistoryManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: historyManager.navigatorKey,
      home: HomePage(historyManager: historyManager),
      routes: {
        '/settings': (context) => SettingsPage(historyManager: historyManager),
        // Define other routes if necessary
      },
    );
  }
}
