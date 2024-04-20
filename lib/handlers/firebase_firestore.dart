import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreOperations {
  late FirebaseFirestore _firestore;

  FirestoreOperations() {
    // Initialize Firebase
    _firestore = FirebaseFirestore.instance;
  }

  Future<void> writeFirestoreData(String collection, String document, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(document).set(data);
      debugPrint('Data written successfully');
    } catch (e) {
      debugPrint('Error writing data: $e');
      throw FormatException('Error writing data: $e');
    }
  }

  Future<Map<String, dynamic>> readFirestoreData(String collection, String document) async {
    try {
      DocumentSnapshot documentSnapshot =
      await _firestore.collection(collection).doc(document).get();

      if (documentSnapshot.exists) {
        debugPrint('User data: ${documentSnapshot.data()}');
        Map<String, dynamic> rs = documentSnapshot.data() as Map<String, dynamic>;
        return rs['Message'] as Map<String, dynamic>;
      } else {
        debugPrint('User not found');
      }
    } catch (e) {
      debugPrint('Error reading data: $e');
      throw FormatException('Error reading data: $e');
    }
    return {} as Map<String, dynamic>;
  }

  Future<void> updateFirestoreData(String collection, String document, Map<String, dynamic> data) async {
    try {
      // Create a reference to the document
      var docRef = _firestore.collection(collection).doc(document);
      // Set the data with merge option to create or update the document
      await docRef.set(data, SetOptions(merge: true));
      debugPrint('Data updated successfully');
    } catch (e) {
      debugPrint('Error updating data: $e');
      throw FormatException('Error updating data: $e');
    }
  }

  Future<void> deleteFirestoreData(String collection, String document) async {
    try {
      await _firestore.collection(collection).doc(document).delete();
      debugPrint('Data deleted successfully');
    } catch (e) {
      debugPrint('Error deleting data: $e');
      throw FormatException('Error deleting data: $e');
    }
  }

  void closeConnection() {
    _firestore.terminate();
    debugPrint('Firestore connection closed');
  }
}
