import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

class ColorPictureController extends GetxController {
  // XFile? profileImage;
  var  bankSelected;
  var bankSelectedLogo;
  
  RxInt _bankValue = 0.obs as RxInt ;
  RxInt get bankValue => _bankValue;

  RxInt _myColor = 0.obs as RxInt;
  RxInt get myColor => _myColor;

  RxInt _orderColor = 0.obs as RxInt;
  RxInt get orderColor => _orderColor;

  RxInt _dashTabColor = 0.obs as RxInt;
  RxInt get dashTabColor => _dashTabColor;

}

