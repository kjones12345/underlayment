// lib/persistence/local_service.dart
import 'package:sembast/sembast.dart';
import 'persistence_service.dart';

class LocalService implements PersistenceService {
  final Database _db;
  final StoreRef<String, Map<String, dynamic>> _store;

  LocalService(this._db, this._store);

  @override
  Future<void> createData(
      String collectionPath, Map<String, dynamic> data) async {
    await _store.record(collectionPath).add(_db, data);
  }

  @override
  Stream<List<Map<String, dynamic>>> readData(String collectionPath) {
    final finder = Finder(filter: Filter.byKey(collectionPath));
    return _store
        .query(finder: finder)
        .onSnapshots(_db)
        .map((snapshot) => snapshot.map((record) => record.value).toList());
  }

  @override
  Future<void> updateData(String docPath, Map<String, dynamic> data) async {
    await _store.record(docPath).update(_db, data);
  }

  @override
  Future<void> deleteData(String docPath) async {
    await _store.record(docPath).delete(_db);
  }
}
