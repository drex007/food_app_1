import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_controller.dart';
import 'package:trofira/ui/views/vendor/setup-brand-profile/add_logo/components/reg_successful_dialog.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/core/models/error.dart';

class AddLogo extends StatefulWidget {
  const AddLogo({Key? key}) : super(key: key);

  @override
  State<AddLogo> createState() => _AddLogoState();
}

class _AddLogoState extends State<AddLogo> {
  File? image;
  final vendorController = Get.find<VendorController>();

  Future selectImage() async {
    try {
      final newImg = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (newImg == null) return;

      final imageTemporary = File(newImg.path);
      setState(() => image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick Image: $e');
      // Todo: display error on dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff363636)),
            onPressed: () => Get.back(),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Add Logo",
            style: TextStyle(
                color: Color(0xff363636),
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                  child: Text(
                "A logo photo enables users quickly recognize your brand.",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontFamily: 'ProximaNova',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              )),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                  onTap: () async {
                    await selectImage();

                    EasyLoading.show(
                      status: "Uploading... ",
                      maskType: EasyLoadingMaskType.black,
                      dismissOnTap: true,
                    );
                    await vendorController.uploadImageAndSaveUrl(image);
                    EasyLoading.dismiss();
                  },
                  child: image != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(image!),
                          radius: 25.0.wp,
                        )
                      : vendorController.vendorLogo.value.isNotEmpty
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(
                                  vendorController.vendorLogo.value),
                              radius: 25.0.wp,
                            )
                          : Image.asset('assets/images/profile/add-picture.png',
                              width: 35.0.wp, height: 35.0.hp)),
              const Spacer(),
              SizedBox(
                height: 48,
                width: 366,
                child: TextButton(
                    onPressed: () async {
                      if (vendorController.vendorLogo.value.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Please add an image",
                          icon: const Icon(Icons.error, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Theme.of(context).primaryColor,
                          colorText: Colors.white,
                        );
                        return;
                      } else {
                        EasyLoading.show(
                            status: "Loading... ",
                            maskType: EasyLoadingMaskType.black,
                            dismissOnTap: true);
                        try {
                          await vendorController.addVendorProfile();
                          EasyLoading.dismiss();

                          await Get.dialog(
                            const Successful(),
                          );
                          Get.offAndToNamed("/");
                        } on Error catch (e) {
                          EasyLoading.dismiss();
                          EasyLoading.showError(e.message,
                              maskType: EasyLoadingMaskType.black,
                              duration: const Duration(seconds: 5),
                              dismissOnTap: true);
                        }
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(15),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xffDC143C)),
                    ),
                    child: const Text(
                      "Complete Registration",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'ProximaNova',
                        fontSize: 18,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
