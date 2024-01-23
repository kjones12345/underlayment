// lib/persistence/service_locator.dart
import 'dart:io' show Platform;
import 'persistence_service.dart';
import 'firestore_service.dart';
import 'local_service.dart';
import 'database_manager.dart';

PersistenceService getPersistenceService() {
  final dbManager = DatabaseManager();

  if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia) {
    return FirestoreService();
  } else {
    // Desktop platforms
    return LocalService(dbManager.database, dbManager.store);
  }
}
