import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static String getFileType(File file) {
    String path = file.path;
    String fileType = path.substring(path.lastIndexOf('.') + 1);
    return fileType;
  }

  static Future<String?> uploadImage(File imageFile, String path) async {
    try {
      String fileType = getFileType(imageFile);
      String imageName = DateTime.now().millisecondsSinceEpoch.toString() + '.$fileType';
      final Reference reference = _storage.ref().child('$path$imageName');
      await reference.putFile(imageFile);
      String imageUrl = await reference.getDownloadURL();
      return imageUrl + '.$fileType';
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
