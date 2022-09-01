import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Controller extends GetxController {
  XFile? profileImage;
}
initializeController () {
  Get.put(Controller());
}