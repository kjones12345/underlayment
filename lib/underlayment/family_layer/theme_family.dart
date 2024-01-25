// lib/underlayment/family_layer/theme_family.dart

import '../abstract_layer/capability.dart';
import 'capability_family.dart';
import '../concrete_layer/themes/golden_theme.dart';
import '../concrete_layer/themes/sky_theme.dart';

class ThemeFamily implements CapabilityFamily {
  @override
  String get familyName => 'Theme';

  @override
  Map<String, Capability> get capabilities => {
        'golden': GoldenTheme(),
        'sky': SkyTheme(),
      };

  @override
  Capability? getCapabilityForPlatform(String platform) {
    // Here you return the theme based on the platform, or any other logic you have
    // This is just an example logic
    if (platform == 'web') {
      return capabilities['sky'];
    } else {
      return capabilities['golden'];
    }
  }
}
