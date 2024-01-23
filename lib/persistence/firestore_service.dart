// lib/persistence/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'persistence_service.dart';

class FirestoreService implements PersistenceService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<void> createData(String collectionPath, Map<String, dynamic> data) {
    return _db.collection(collectionPath).add(data);
  }

  @override
  Stream<List<Map<String, dynamic>>> readData(String collectionPath) {
    return _db
        .collection(collectionPath)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Future<void> updateData(String docPath, Map<String, dynamic> data) {
    return _db.doc(docPath).update(data);
  }

  @override
  Future<void> deleteData(String docPath) {
    return _db.doc(docPath).delete();
  }
}
