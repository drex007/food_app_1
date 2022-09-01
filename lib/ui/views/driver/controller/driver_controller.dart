import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:get/get.dart';
import 'package:trofira/ui/views/driver/controller/driver_provider.dart';
import '../../../../core/constants/trofira_enums.dart';
import "package:trofira/core/models/error.dart";

class DriverController extends GetxController {
  final DriverProvider driverProvider;

  DriverController({
    required this.driverProvider,
  });

  // state
  RxBool loading = false.obs;
  final driverStatus = DriverStatus.loading.obs;
  RxString driverLicenseImageUrl = "".obs;

  @override
  void onInit() async {
    super.onInit();
    // check if vendor has set up brand name here and set state accordingly

    await checkIfDriverProfileIsSetUp();
  }

  Future checkIfDriverProfileIsSetUp() async {
    loading.value = true;
    try {
      final response = await driverProvider.getDriverProfileDetail();
      // vendorProfile.value = VendorProfile.fromJson(response['data']);
      driverStatus.value = DriverStatus.initialized;
    } on Error catch (e) {
      if (e.statusCode == 404) {
        // vendor has not setup profile yet
        // CHANGE STATE TO UNINITIALIZED
        driverStatus.value = DriverStatus.uninitialized;
      }
    }
    loading.value = false;
  }

  Future uploadLicense(File file) async {
    CloudinaryResponse response = await driverProvider.uploadImage(file);
    print(response.secureUrl);
    driverLicenseImageUrl.value = response.secureUrl;
  }

  Future addDriverProfile(
      String licenseNumber, String year, String month, String day, String address) async {
    return driverProvider.addDriverProfile(
        licenseNumber, year, month, day, address, driverLicenseImageUrl.value);
  }
}
