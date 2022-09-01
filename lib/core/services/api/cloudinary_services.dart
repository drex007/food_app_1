import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:trofira/config/trofira_secrets.dart';

class CloudinaryService {
  final cloudinary = CloudinaryPublic(
      TrofiraSecrets.CLOUDINARY_CLOUD_NAME, 'vvxymibd',
      cache: false);

  Future uploadImage(File? image) async {
    return await cloudinary.uploadFile(
      CloudinaryFile.fromFile(image!.path,
          resourceType: CloudinaryResourceType.Image),
    );
  }

  Future deleteImage(String image) async {
    return await cloudinary.client?.delete(
      Uri.parse(image),
    );
  }
}
