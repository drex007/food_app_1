import 'package:flutter/material.dart';
import 'package:trofira/core/constants/trofira_enums.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_controller.dart';
import 'package:get/get.dart';
import 'package:trofira/ui/views/vendor/setup-brand-profile/find-brand-name/find_brand_name.dart';

import 'package:trofira/ui/views/vendorsDashboard/components/dashboard/page_controller.dart';

class InitVendor extends StatefulWidget {
  const InitVendor({Key? key}) : super(key: key);

  @override
  State<InitVendor> createState() => _InitVendorState();
}

class _InitVendorState extends State<InitVendor> {
  final vendorController = Get.find<VendorController>();

  @override
  void initState() {
    super.initState();
    vendorController.checkIfBrandNameSetUp();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!vendorController.loading.value &&
          vendorController.vendorStatus.value == VendorStatus.uninitialized) {
        return const FindBrandName();
      }
      if (!vendorController.loading.value &&
          vendorController.vendorStatus.value == VendorStatus.initialized) {
        return const DashboardPageController()
            //  VendorDashboardPageController()
            ;
      }

      return SafeArea(
        child: Scaffold(
          body: Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          )),
        ),
      );
    });
  }
}
