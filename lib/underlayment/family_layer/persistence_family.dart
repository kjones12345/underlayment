// lib/underlayment/family_layer/persistence_family.dart

import '../abstract_layer/capability.dart';
import 'capability_family.dart';
import '../utils/service_locator.dart';

class PersistenceFamily implements CapabilityFamily {
  @override
  String get familyName => 'Persistence';

  @override
  Map<String, Capability> get capabilities => {
        'firestore': getPersistenceService(isWeb: false),
        'local': getPersistenceService(isWeb: true),
      };

  @override
  Capability? getCapabilityForPlatform(String platform) {
    // Based on platform, decide which persistence service to use
    if (platform == 'web') {
      return capabilities['local'];
    } else {
      return capabilities['firestore'];
    }
  }
}
