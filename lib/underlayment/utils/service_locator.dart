// lib/underlayment/utils/service_locator.dart

import '../concrete_layer/persistence/persistence_service.dart';
import '../concrete_layer/persistence/firestore_service.dart';
import '../concrete_layer/persistence/local_service.dart';
import '../concrete_layer/persistence/database_manager.dart';

PersistenceService getPersistenceService({bool isWeb = false}) {
  final dbManager = DatabaseManager();

  if (isWeb) {
    return LocalService(dbManager.database, dbManager.store);
  } else {
    return FirestoreService();
  }
}
