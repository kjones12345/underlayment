// lib/underlayment/abstract_layer/capability.dart

abstract class Capability {
  String get name;
  void configure(Map<String, dynamic> configurations);
}
