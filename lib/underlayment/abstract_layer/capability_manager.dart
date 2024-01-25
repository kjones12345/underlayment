// lib/underlayment/abstract_layer/capability_manager.dart

import 'capability.dart';

class CapabilityManager {
  final Map<String, Capability> _capabilities = {};

  void registerCapability(Capability capability) {
    _capabilities[capability.name] = capability;
  }

  Capability? getCapability(String name) {
    return _capabilities[name];
  }

  void configureCapability(String name, Map<String, dynamic> configurations) {
    final capability = getCapability(name);
    capability?.configure(configurations);
  }
}
