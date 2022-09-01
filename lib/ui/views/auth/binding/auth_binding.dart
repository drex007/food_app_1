import 'package:get/get.dart';
import 'package:trofira/ui/views/auth/controller/auth_controller.dart';
import 'package:trofira/ui/views/auth/controller/auth_provider.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(authProvider: AuthProvider()));
  }
}
