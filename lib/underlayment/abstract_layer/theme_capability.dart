// lib/underlayment/abstract_layer/theme_capability.dart

import 'capability.dart';
import 'package:flutter/material.dart';

abstract class ThemeCapability extends Capability {
  ThemeData getThemeData();
  void applyTheme(ThemeData themeData);
}
