import 'package:get/get.dart';
import 'package:trofira/ui/views/auth/binding/auth_binding.dart';
import 'package:trofira/ui/views/auth/init_app.dart';
import 'package:trofira/ui/views/auth/login_signup/email_opt_verification.dart';
import 'package:trofira/ui/views/auth/forgot_password/forgot_password.dart';
import 'package:trofira/ui/views/auth/forgot_password/set_new_password.dart';
import 'package:trofira/ui/views/auth/login_signup/sign_up.dart';
import 'package:trofira/ui/views/driver/driversDashboard/menu/main_menu.dart';
import 'package:trofira/ui/views/driver/setup_driver_info.dart';
import 'package:trofira/ui/views/onboarding/onboarding.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_controller.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_provider.dart';
import 'package:trofira/ui/views/vendor/init_vendor.dart';
import 'package:trofira/ui/views/vendor/setup-brand-profile/add_logo/add_logo.dart';
import 'package:trofira/ui/views/vendor/setup-brand-profile/find-brand-name/find_brand_name.dart';
import 'package:trofira/ui/views/vendor/setup-brand-profile/food_brand_info/food_brand_info.dart';
import 'package:trofira/ui/views/auth/login_signup/login.dart';
import 'auth/forgot_password/forgot_password_email_opt_verification.dart';
import 'auth/getting-started/getting_started.dart';

class PageRouter {
  static List<GetPage<dynamic>> getPages() {
    return [
      GetPage(name: "/", page: () => InitAppView(), binding: AuthBinding()),
      GetPage(
        name: "/onboarding",
        page: () => Onboarding(),
      ),
      GetPage(
        name: "/get-started",
        page: () => const GettingStarted(),
      ),
      GetPage(
        name: "/signup",
        page: () => SignUp(),
      ),
      GetPage(
        name: "/verify_email",
        page: () => const EmailOtpVerification(),
      ),
      GetPage(
        name: "/forgot_password",
        page: () => const ForgotPassword(),
      ),
      GetPage(
        name: "/set_new_password",
        page: () => const SetNewPassword(),
      ),
      GetPage(
        name: "/forgot_password_otp",
        page: () => const ForgotPasswordEmailOtpVerification(),
      ),
      GetPage(
          name: "/vendor",
          page: () => InitVendor(),
          binding: BindingsBuilder(() {
            Get.lazyPut<VendorController>(
                () => VendorController(vendorProvider: VendorProvider()));
          })),
      GetPage(
        name: "/find_brand_name",
        page: () => const FindBrandName(),
      ),
      GetPage(
        name: "/brand_info",
        page: () => BrandInfo(),
      ),
      GetPage(
        name: "/add_logo",
        page: () => const AddLogo(),
      ),
      GetPage(
        name: "/vendor_menu",
        page: () => const MainMenuScreen(),
      ),
      GetPage(
        name: "/setup_driver_info",
        page: () => SetupDriverInfo(),
      ),
      GetPage(
        name: "/login",
        page: () => Login(),
      )
    ];
  }
}
