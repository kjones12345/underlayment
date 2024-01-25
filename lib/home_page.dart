// home_page.dart
import 'package:flutter/material.dart';
import 'android_back_button_handler.dart';
import 'history_manager.dart';

class HomePage extends StatefulWidget {
  final HistoryManager historyManager;

  HomePage({required this.historyManager});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AndroidBackButtonHandler(
      onBack: widget.historyManager.canGoBack()
          ? widget.historyManager.goBack
          : null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
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
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                widget.historyManager.navigateTo('/settings');
              },
            ),
          ],
        ),
        body: Center(
          child: Text('This is the Home Page'),
        ),
      ),
    );
  }
}
