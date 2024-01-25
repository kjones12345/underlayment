import 'package:flutter/material.dart';
import '../abstract_layer/theme_capability.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  ThemeData get themeData => _themeData;

  set themeData(ThemeData newThemeData) {
    _themeData = newThemeData;
    notifyListeners();
  }

  void applyTheme(ThemeCapability? themeCapability) {
    if (themeCapability != null) {
      themeData = themeCapability.getThemeData();
    }
  }
}
