import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';

class CloudinaryService {
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