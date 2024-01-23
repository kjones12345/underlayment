// lib/persistence/persistence_service.dart
abstract class PersistenceService {
  Future<void> createData(String collectionPath, Map<String, dynamic> data);
  Stream<List<Map<String, dynamic>>> readData(String collectionPath);
  Future<void> updateData(String docPath, Map<String, dynamic> data);
  Future<void> deleteData(String docPath);
}
