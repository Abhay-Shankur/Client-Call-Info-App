import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FirebaseStorageService {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static String getFileType(File file) {
    String path = file.path;
    String fileType = path.substring(path.lastIndexOf('.') + 1);
    return fileType;
  }

  //TODO: HIGHER P (ADD FILE NAME OPTION)
  static Future<String?> uploadImage(File imageFile, String path, String? name) async {
    try {
      String fileType = getFileType(imageFile);
      String imageName =  '${name ?? DateTime.now().millisecondsSinceEpoch.toString()}.$fileType';
      final Reference reference = _storage.ref().child('$path$imageName');
      await reference.putFile(imageFile);
      String imageUrl = await reference.getDownloadURL();
      return '$imageUrl.$fileType';
    } catch (e) {
      debugPrint('Error uploading image: $e');
      return null;
    }
  }

  // Function to delete a file from Firebase Storage
  static Future<void> deleteFile(String folderPath, String fileName) async {
    try {
      // Create a reference to the file to be deleted
      Reference storageReference = FirebaseStorage.instance.ref().child(folderPath).child(fileName);

      // Delete the file
      await storageReference.delete();

      debugPrint('File deleted successfully');
    } catch (e) {
      debugPrint('Error deleting file: $e');
      throw Exception('Error deleting file: $e');
    }
  }

  static Future<void> deleteFolder(String folderPath) async {
    try {
      // Get a reference to the folder
      Reference folderReference = FirebaseStorage.instance.ref().child(folderPath);

      // List all items (files) in the folder
      ListResult result = await folderReference.listAll();

      // Iterate over each item and delete it
      for (Reference item in result.items) {
        await item.delete();
      }

      // Optionally, delete subfolders recursively
      for (Reference prefix in result.prefixes) {
        await deleteFolder(prefix.fullPath); // Recursively delete subfolders
      }

      debugPrint('Folder and its contents deleted successfully');
    } catch (e) {
      debugPrint('Error deleting folder: $e');
      throw Exception('Error deleting folder: $e');
    }
  }

}
