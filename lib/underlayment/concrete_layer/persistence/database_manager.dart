// database_manager.dart
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';
import '../../abstract_layer/capability.dart';

class DatabaseManager implements Capability {
  static final DatabaseManager _instance = DatabaseManager._internal();
  Database? _db;
  StoreRef<String, Map<String, dynamic>>? _store;

  @override
  String get name => 'DatabaseManager'; // Unique name for this capability

  @override
  void configure(Map<String, dynamic> configurations) {
    // Here you can configure the DatabaseManager based on the provided configurations
  }

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._internal();

  Future<void> init() async {
    if (kIsWeb) {
      // For Web
      DatabaseFactory dbFactory = databaseFactoryWeb;
      _db = await dbFactory.openDatabase('underlayment_web_db');
    } else {
      // For other platforms (mobile or desktop)
      // Keep your existing code for sembast_io here
    }

    _store = stringMapStoreFactory.store('underlayment_web_db');
  }

  Database get database => _db!;
  StoreRef<String, Map<String, dynamic>> get store => _store!;
}
