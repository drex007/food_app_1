import 'dart:io';

import 'package:trofira/core/services/api/api_service.dart';
import 'package:trofira/core/services/api/cloudinary_services.dart';
import 'package:trofira/core/services/api/endpoints.dart';
import 'package:trofira/core/services/storage/storage.dart';
import 'package:get/get.dart';

class VendorProvider {
  final StorageService storageService = Get.find<StorageService>();
  final ApiService apiService = Get.find<ApiService>();
  final CloudinaryService cloudinaryService = Get.find<CloudinaryService>();

  Future getVendorProfileDetail() async {
    return apiService.secureHttpGetCall(
        endpoint: Endpoints.getVendorProfileDetails);
  }

  Future addVendorProfile(Map<String, dynamic> data) async {
    try {
      final result = apiService.secureHttpPostCall(
          endpoint: Endpoints.addVendorProfile, data: data);
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future uploadImage(File? image) async {
    return await cloudinaryService.uploadImage(image);
  }

  Future deleteImage(String image) async {
    return await cloudinaryService.deleteImage(image);
  }

  Future searchVendors(String searchText) async {
    return apiService.secureHttpGetCall(
      endpoint: Endpoints.searchVendor,
    );
  }

  Future getOrders() async{
      return apiService.secureHttpGetCall(
      endpoint: Endpoints.orders,
    );
  }
}
