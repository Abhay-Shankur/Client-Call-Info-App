import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreHandler {
  late FirebaseFirestore _firestore;

  FirestoreHandler() {
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
        // debugPrint('User data: ${documentSnapshot.data()}');
        Map<String, dynamic> rs = documentSnapshot.data() as Map<String, dynamic>;
        // return rs['Message'] as Map<String, dynamic>;
        return rs;
      } else {
        debugPrint('Docs not found');
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

  Future<dynamic> readFieldAtPath(String collection, String document, String fieldPath,
      {String separator = "/"}) async {
    try {
      DocumentSnapshot documentSnapshot = await _firestore.collection(collection).doc(document).get();

      if (documentSnapshot.exists) {
        // Split the field path into segments
        List<String> segments = fieldPath.split(separator);

        // Get the value of the field at the specified path
        dynamic fieldValue = documentSnapshot.data();
        for (String segment in segments) {
          if (fieldValue is Map<String, dynamic> && fieldValue.containsKey(segment)) {
            fieldValue = fieldValue[segment];
          } else {
            fieldValue = null;
            break;
          }
        }

        debugPrint('Field value for $fieldPath: ${fieldValue.toString()}');
        return fieldValue;
      } else {
        debugPrint('Document not found');
      }
    } catch (e) {
      debugPrint('Error reading field value: $e');
      throw FormatException('Error reading field value: $e');
    }
    return null; // Return null if document not found or field doesn't exist
  }

  Future<void> removeField(String collection, String document, String nestedFieldPath) async {
    try {
      // Create a reference to the document
      var docRef = _firestore.collection(collection).doc(document);

      // Update the document by deleting the specified nested field
      await docRef.update({
        nestedFieldPath: FieldValue.delete(),
      });

      debugPrint('Field "$nestedFieldPath" removed successfully from document "$document" in collection "$collection"');
    } catch (e) {
      debugPrint('Error removing field: $e');
      throw Exception('Error removing field: $e');
    }
  }

  Future<void> deleteListItemAtIndexAtPath(String collection, String document, String listPath, int index) async {
    try {
      // Create a reference to the document
      var docRef = _firestore.collection(collection).doc(document);

      // Get the current list
      var snapshot = await docRef.get();
      var currentList = snapshot.data()?[listPath] ?? [];

      // Check if the index is valid
      if (index >= 0 && index < currentList.length) {
        // Remove the item at the specified index from the list
        currentList.removeAt(index);

        // Update the list in Firestore
        await docRef.update({
          listPath: currentList,
        });

        debugPrint('Item deleted from list at index $index and path $listPath successfully');
      } else {
        debugPrint('Invalid index');
        throw Exception('Invalid index');
      }
    } catch (e) {
      debugPrint('Error deleting item from list at index and path: $e');
      throw FormatException('Error deleting item from list at index and path: $e');
    }
  }

  Future<bool> isExists(String collection, String documentId) async {
    // Create a reference to the document
    var docRef = _firestore.collection(collection).doc(documentId);

    // Check if the document already exists
    var snapshot = await docRef.get();
    if (snapshot.exists) {
      return true;
    }
    return false;
  }

  Future<void> createEmptyDocument(String collection, String documentId) async {
    try {
      // Create a reference to the document
      var docRef = _firestore.collection(collection).doc(documentId);

      // Check if the document already exists
      var snapshot = await docRef.get();
      if (snapshot.exists) {
        debugPrint('Document already exists');
        throw Exception('Document already exists');
      }

      // Create the document with empty data
      await docRef.set({});

      debugPrint('Empty document created successfully');
    } catch (e) {
      debugPrint('Error creating empty document: $e');
      throw FormatException('Error creating empty document: $e');
    }
  }


  Future<void> renameDocument(String collection, String currentDocument, String newDocument) async {
    try {
      // Get a reference to the current document
      var docRef = _firestore.collection(collection).doc(currentDocument);

      // Get the data from the current document
      var snapshot = await docRef.get();

      // Check if the current document exists
      if (snapshot.exists) {
        // Create a reference to the new document
        var newDocRef = _firestore.collection(collection).doc(newDocument);

        // Move the data to the new document
        await newDocRef.set(snapshot.data() ?? {});

        // Delete the current document
        await docRef.delete();

        debugPrint('Document renamed successfully');
      } else {
        debugPrint('Current document does not exist');
        throw Exception('Current document does not exist');
      }
    } catch (e) {
      debugPrint('Error renaming document: $e');
      throw FormatException('Error renaming document: $e');
    }
  }

  Future<void> pushToArray(String collection, String document, String fieldPath, dynamic value) async {
    try {
      // Create a reference to the document
      var docRef = _firestore.collection(collection).doc(document);

      // Update the array field
      await docRef.update({
        fieldPath: FieldValue.arrayUnion([value]),
      });

      debugPrint('Value pushed to array successfully');
    } catch (e) {
      debugPrint('Error pushing value to array: $e');
      throw FormatException('Error pushing value to array: $e');
    }
  }

  //Function to get Document Names
  Future<List<String>?> getDocumentNames(String collection) async {
    try {
      // Get the reference to the collection
      var collectionRef = _firestore.collection(collection);

      // Get all documents in the collection
      QuerySnapshot querySnapshot = await collectionRef.get();

      // Extract the document IDs
      List<String> documentNames = querySnapshot.docs.map((doc) => doc.id).toList();

      return documentNames;
    } catch (e) {
      print('Error getting document names: $e');
      throw FormatException('Error getting document names: $e');
    }
  }

  void closeConnection() {
    _firestore.terminate();
    debugPrint('Firestore connection closed');
  }
}
