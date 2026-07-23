import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';


// up to server and get url
class ProfileImageUploadService {
  final cloudinary = CloudinaryPublic(
    'blylubhk',
    'qzzlmuvj',
    cache: false,
  );

  Future<String> uploadProfileImage(File image) async {
    final response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(
        image.path,
        folder: 'users',
        resourceType: CloudinaryResourceType.Image,
      ),
    );

    return response.secureUrl;
  }
}