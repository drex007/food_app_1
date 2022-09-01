import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trofira/core/constants/trofira_enums.dart';
import 'package:trofira/ui/views/auth/controller/auth_controller.dart';
import 'package:trofira/ui/views/auth/login_signup/login.dart';
import 'package:trofira/ui/views/driver/init_driver.dart';
import 'package:trofira/ui/views/onboarding/onboarding.dart';
import 'package:trofira/ui/views/onboarding/splash-screen.dart';
import 'package:trofira/ui/views/vendor/init_vendor.dart';


class InitAppView extends StatelessWidget {
  InitAppView({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if ( authController.appStatus.value == AppStatus.onboarding) {
        return Onboarding();
      }
      if (authController.appStatus.value == AppStatus.unauthenticated) {
        return Login();
      }
      if (authController.appStatus.value == AppStatus.authenticated) {
        if (authController.user.value.userType == "vendor") {
      
          return const InitVendor();
        } else {
          return InitDriver();
        }
      }
      return const SplashScreen();
    });
  }
}
