import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:trofira/core/constants/trofira_enums.dart';
import 'package:trofira/ui/views/auth/controller/auth_controller.dart';
import 'package:trofira/ui/views/driver/controller/driver_controller.dart';
import 'package:trofira/ui/views/driver/driversDashboard/mainPage.dart';
import 'package:trofira/ui/views/driver/setup_driver_info.dart';

class InitDriver extends StatefulWidget {
  const InitDriver({Key? key}) : super(key: key);

  @override
  State<InitDriver> createState() => _InitDriverState();
}

class _InitDriverState extends State<InitDriver> {
  final authController = Get.find<AuthController>();

  final driverController = Get.find<DriverController>();

  @override
  void initState() {
    super.initState();
    driverController.checkIfDriverProfileIsSetUp();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!driverController.loading.value &&
          driverController.driverStatus.value == DriverStatus.uninitialized) {
        return SetupDriverInfo();
      }
      if (!driverController.loading.value &&
          driverController.driverStatus.value == DriverStatus.initialized) {
        return const DriversMainPage();
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
