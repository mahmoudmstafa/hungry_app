import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadProfileImage(File image, String firebaseUid) async {
    final ref = _storage.ref().child(
      'users/$firebaseUid/profile.jpg',
    );

    await ref.putFile(image);

    return await ref.getDownloadURL();
  }
}