// lib/underlayment/family_layer/capability_family.dart

import '../abstract_layer/capability.dart';

abstract class CapabilityFamily {
  String get familyName;
  Map<String, Capability> get capabilities;

  Capability? getCapabilityForPlatform(String platform) {
    // Implementation to return a capability based on the platform
  }
}
