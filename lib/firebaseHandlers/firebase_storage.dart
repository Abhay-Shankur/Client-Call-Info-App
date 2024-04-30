import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

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
      String imageName =  (name ?? DateTime.now().millisecondsSinceEpoch.toString()) + '.$fileType';
      final Reference reference = _storage.ref().child('$path$imageName');
      await reference.putFile(imageFile);
      String imageUrl = await reference.getDownloadURL();
      return imageUrl + '.$fileType';
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  static Future<String> uploadFile(File file, String folderName, String fileName) async {
    try {
      // Create a reference to the Firebase storage bucket
      Reference storageReference = _storage.ref().child(folderName).child(fileName);

      // Upload the file to Firebase Cloud Storage
      TaskSnapshot uploadTask = await storageReference.putFile(file);

      // Get the download URL of the uploaded file
      String downloadURL = await uploadTask.ref.getDownloadURL();

      // Return the download URL
      return downloadURL;
    } catch (e) {
      // Handle any errors that occur during the upload process
      print('Error uploading file: $e');
      return '';
    }
  }
}
