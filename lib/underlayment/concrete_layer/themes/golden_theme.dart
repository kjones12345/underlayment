// lib/underlayment/concrete_layer/themes/golden_theme.dart

import '../../abstract_layer/theme_capability.dart';
import 'package:flutter/material.dart';

class GoldenTheme implements ThemeCapability {
  @override
  String get name => 'GoldenTheme';

  @override
  void configure(Map<String, dynamic> configurations) {
    // Configure the Golden Theme based on the configurations if needed
  }

  @override
  ThemeData getThemeData() {
    // Return your ThemeData for GoldenTheme
    return ThemeData(
      primarySwatch: Colors.amber,
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
