// database_manager.dart
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  Database? _db;
  StoreRef<String, Map<String, dynamic>>? _store;

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

    _store = stringMapStoreFactory.store('your_store_name');
  }

  Database get database => _db!;
  StoreRef<String, Map<String, dynamic>> get store => _store!;
}
