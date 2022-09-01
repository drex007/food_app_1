import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trofira/core/constants/trofira_enums.dart';
import 'package:trofira/core/models/error.dart';
import 'package:trofira/core/models/vendorProfile.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_provider.dart';

class VendorController extends GetxController {
  final VendorProvider vendorProvider;

  final vendorStatus = VendorStatus.loading.obs;

  final vendorProfile = const VendorProfile(
          country: "",
          address: "",
          createdAt: "",
          logo: "",
          id: "",
          instagramId: "",
          facebookId: "",
          name: "",
          phone: "",
          services: [""],
          status: "",
          user: VendorUser(id: "", fullName: "", email: ""),
          userId: "")
      .obs;
//controllers
  RxString state = "".obs;
  RxString vendorLogo = "".obs;
  Rx<File?> image = (null).obs;
  RxBool loading = false.obs;
  final vendorNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final vendorAddressController = TextEditingController();
  final vendorFacebookIdController = TextEditingController();
  final vendorInstagramIdController = TextEditingController();

  XFile? profileImage;
  var bankSelected;
  var bankSelectedLogo;
  RxInt _bankValue = 0.obs as RxInt;
  RxInt get bankValue => _bankValue;
  RxInt _myColor = 0.obs as RxInt;
  RxInt get myColor => _myColor;

  VendorController({
    required this.vendorProvider,
  });

  @override
  void onInit() async {
    super.onInit();
    // check if vendor has set up brand name here and set state accordingly

    await checkIfBrandNameSetUp();
  }

  Future checkIfBrandNameSetUp() async {
    loading.value = true;
    try {
      final response = await vendorProvider.getVendorProfileDetail();
      vendorProfile.value = VendorProfile.fromJson(response['data']);
      vendorStatus.value = VendorStatus.initialized;
    } on Error catch (e) {
      if (e.statusCode == 404) {
        // vendor has not setup profile yet
        // CHANGE STATE TO UNINITIALIZED
        vendorStatus.value = VendorStatus.uninitialized;
      }
    }
    loading.value = false;
  }

  Future getVendorProfileDetail() async {
    return await vendorProvider.getVendorProfileDetail();
  }

  void updateState(String value) {
    state.value = value;
  }

  Future addVendorProfile() async {
    try {
      return await vendorProvider.addVendorProfile({
        "name": vendorNameController.text,
        "state": state.value.trim(),
        "country": "nigeria",
        "phone": phoneNumberController.text,
        "address": vendorAddressController.text,
        "facebookId": vendorFacebookIdController.text,
        "instagramId": vendorInstagramIdController.text,
        "logo": vendorLogo.value,
        "services": ["vendor"],
        "status": "active"
      });
    } on Error catch (e) {
      rethrow;
    }
  }

  Future uploadImageAndSaveUrl(File? image) async {
    try {
      if (vendorLogo.value.isNotEmpty) {
        final http.Response res =
            await vendorProvider.deleteImage(vendorLogo.value);
        print(res.statusCode);
      }
      CloudinaryResponse response = await vendorProvider.uploadImage(image);

      print(response.secureUrl);
      vendorLogo.value = response.secureUrl;
    } on CloudinaryException catch (e) {
      throw Error(statusCode: e.statusCode, message: e.responseString);
    }
  }

  Future searchVendors(String searchText) async {
    return await vendorProvider.searchVendors(searchText);
  }

  Future getOrders() async {
    final orders = await vendorProvider.getOrders();
    print(orders);
  }
}
