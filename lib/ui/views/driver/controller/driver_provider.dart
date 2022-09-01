import 'dart:io';

import 'package:trofira/core/services/api/api_service.dart';
import 'package:trofira/core/services/api/cloudinary_services.dart';
import 'package:trofira/core/services/api/endpoints.dart';
import 'package:trofira/core/services/storage/storage.dart';
import 'package:get/get.dart';

class DriverProvider {
  final StorageService _storageService = Get.find<StorageService>();
  final ApiService _apiService = Get.find<ApiService>();
  final CloudinaryService _cloudinaryService = Get.find<CloudinaryService>();

  Future getDriverProfileDetail() async {
    return _apiService.secureHttpGetCall(
        endpoint: Endpoints.getDriverProfileDetails);
  }

  Future uploadImage(File? image) async {
    return await _cloudinaryService.uploadImage(image);
  }

  Future addDriverProfile(String licenseNumber, String year, String month,
      String day, String address, String driverLicenseImageUrl) async {
    return _apiService
        .secureHttpPostCall(endpoint: Endpoints.getDriverProfileDetails, data: {
      "licenceNumber": licenseNumber,
      "licenceExpiryNumber": "$year$month$day",
      "licenceExpiryUrl": driverLicenseImageUrl,
      "carModel": "Toyota",
      "address": address,
      "logo": driverLicenseImageUrl,
      "isAvailable": "true"
    });
  }
}
