// history_manager.dart
import 'package:flutter/material.dart';

class HistoryManager {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  List<String> _routeHistory = ['/']; // Initial route is the home page.
  int _positionPointer = 0;
  int _virtualEndPointer = 0;

  // Getter for current route
  String get currentRoute => _routeHistory[_positionPointer];

  // Method to navigate to a new page
  void navigateTo(String routeName) {
    // If navigating to a new page, remove all routes ahead of the current position
    if (_positionPointer < _virtualEndPointer) {
      _routeHistory = _routeHistory.sublist(0, _positionPointer + 1);
    }

    _positionPointer++;
    _virtualEndPointer = _positionPointer;
    _routeHistory.add(routeName);
    navigatorKey.currentState?.pushNamed(routeName);
  }

  // Method to go back in history
  void goBack() {
    if (canGoBack()) {
      _positionPointer--;
      navigatorKey.currentState?.pop();
    }
  }

  // Method to go forward in history
  void goForward() {
    if (canGoForward()) {
      _positionPointer++;
      String routeName = _routeHistory[_positionPointer];
      navigatorKey.currentState?.pushNamed(routeName);
    }
  }

  // Check if back navigation is possible
  bool canGoBack() => _positionPointer > 0;

  // Check if forward navigation is possible
  bool canGoForward() => _positionPointer < _virtualEndPointer;
}
