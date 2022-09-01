import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trofira/core/constants/trofira_colors.dart';
import 'package:trofira/core/services/api/api_service.dart';
import 'package:trofira/core/services/api/cloudinary_services.dart';
import 'package:trofira/core/services/storage/storage.dart';
import 'package:trofira/ui/views/auth/controller/auth_provider.dart';
import 'package:trofira/ui/views/auth/controller/colorPicturesController.dart';
import 'package:trofira/ui/views/page_router.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_controller.dart';
import 'package:trofira/ui/views/driver/controller/driver_controller.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_provider.dart';

import 'ui/views/auth/controller/auth_controller.dart';
import 'ui/views/driver/controller/driver_provider.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put(ColorPictureController());

  Get.put<ApiService>(ApiService());
  Get.put<CloudinaryService>(CloudinaryService());
  Get.put<AuthController>(AuthController(authProvider: AuthProvider()));
   Get.lazyPut<VendorController>(
      () => VendorController(vendorProvider: VendorProvider()));
  // Get.put<VendorController>(VendorController(vendorProvider: VendorProvider()));
  Get.lazyPut<DriverController>(
      () => DriverController(driverProvider: DriverProvider()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Trofira',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProximaNova',
        primarySwatch: AppColors.primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
        ),
      ),
      builder: EasyLoading.init(),
      getPages: PageRouter.getPages(),
      initialRoute: "/",
    );
  }
}
