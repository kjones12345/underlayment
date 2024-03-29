// settings_page.dart
import 'package:flutter/material.dart';
import 'android_back_button_handler.dart';
import 'history_manager.dart';

class SettingsPage extends StatefulWidget {
  final HistoryManager historyManager;

  SettingsPage({required this.historyManager});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return AndroidBackButtonHandler(
      onBack: widget.historyManager.canGoBack()
          ? widget.historyManager.goBack
          : null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: widget.historyManager.canGoBack()
                ? widget.historyManager.goBack
                : null,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: widget.historyManager.canGoForward()
                  ? widget.historyManager.goForward
                  : null,
            ),
          ],
        ),
        body: Center(
          child: Text('This is the Settings Page'),
        ),
      ),
    );
  }
}
