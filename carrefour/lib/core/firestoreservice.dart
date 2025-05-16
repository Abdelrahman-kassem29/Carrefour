import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetch all documents from a collection
  Future<List<Map<String, dynamic>>> fetchCollection(String collectionPath) async {
    try {
      QuerySnapshot snapshot = await _db.collection(collectionPath).get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error fetching collection $collectionPath: $e');
      return [];
    }
  }

  // Fetch a single document by ID
  Future<Map<String, dynamic>?> fetchDocument(String collectionPath, String docId) async {
    try {
      DocumentSnapshot doc = await _db.collection(collectionPath).doc(docId).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>?;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching document $docId in $collectionPath: $e');
      return null;
    }
  }

  // Add a document to a collection (auto-generated ID)
  Future<void> addDocument(String collectionPath, Map<String, dynamic> data) async {
    try {
      await _db.collection(collectionPath).add(data);
    } catch (e) {
      print('Error adding document to $collectionPath: $e');
    }
  }

  // Set or update a document with a specific ID
  Future<void> setDocument(String collectionPath, String docId, Map<String, dynamic> data) async {
    try {
      await _db.collection(collectionPath).doc(docId).set(data, SetOptions(merge: true));
    } catch (e) {
      print('Error setting document $docId in $collectionPath: $e');
    }
  }

  // Delete a document
  Future<void> deleteDocument(String collectionPath, String docId) async {
    try {
      await _db.collection(collectionPath).doc(docId).delete();
    } catch (e) {
      print('Error deleting document $docId in $collectionPath: $e');
    }
  }

  // Stream a collection (real-time updates)
  Stream<List<Map<String, dynamic>>> streamCollection(String collectionPath) {
    return _db.collection(collectionPath).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList()
    );
  }
}
