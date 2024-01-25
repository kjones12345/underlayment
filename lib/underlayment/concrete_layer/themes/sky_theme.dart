// lib/underlayment/concrete_layer/themes/sky_theme.dart

import '../../abstract_layer/theme_capability.dart';
import 'package:flutter/material.dart';

class SkyTheme implements ThemeCapability {
  @override
  String get name => 'SkyTheme';

  @override
  void configure(Map<String, dynamic> configurations) {
    // Configure the Sky Theme based on the configurations if needed
  }

  @override
  ThemeData getThemeData() {
    // Return your ThemeData for SkyTheme
    return ThemeData(
      primarySwatch: Colors.lightBlue,
      brightness: Brightness.light,
    );
  }

  @override
  void applyTheme(ThemeData themeData) {
    // Apply the themeData to your app (This can be handled by your app's theme management)
  }

  // For both GoldenTheme and SkyTheme
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeCapability &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
