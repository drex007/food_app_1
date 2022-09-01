import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/driver/controller/driver_controller.dart';
import 'package:trofira/ui/views/driver/widgets/expiryDay.dart';
import 'package:trofira/ui/views/driver/widgets/expiryMonth.dart';
import 'package:trofira/ui/views/driver/widgets/expiryYear.dart';
import 'package:trofira/ui/views/widgets/shared_text_field.dart';

class SetupDriverInfo extends StatefulWidget {
  const SetupDriverInfo({Key? key}) : super(key: key);

  @override
  State<SetupDriverInfo> createState() => _SetupDriverInfoState();
}

class _SetupDriverInfoState extends State<SetupDriverInfo> {
  final driverController = Get.find<DriverController>();
  final formKey = GlobalKey<FormState>();
  File? image;

  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String year = "";
  String month = "";
  String day = "";

  List documents = [ExpiryYear(), ExpiryMonth(), ExpiryDay()];

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: const Text("Document",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: "ProximaNova")),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Container(
                margin: EdgeInsets.only(left: 5.0.wp, right: 5.0.wp),
                child: const Center(
                    child: Text(
                  "Your documents are legally required to sign you up as a driver",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ))),
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(
                  bottom: 2.0.hp, top: 2.0.hp, left: 0.0.wp, right: 5.0.wp),
              child: Padding(
                padding: EdgeInsets.only(left: 5.0.wp),
                child: SharedTextField(
                    controller: licenseNumberController,
                    label: "Drivers License Number",
                    keyBoardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) return "required!";
                    }),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: DropdownButtonFormField<String>(
                  decoration: SharedTextField.textFormInputDecoration(
                    label: "Expiry Year",
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Required';
                    }
                    return null;
                  },
                  // hint: Text("Type of Service "),
                  items: List.generate(
                    5,
                    (index) => DropdownMenuItem(
                      child: Text("${DateTime.now().year + index}"),
                      value: "${DateTime.now().year + index}",
                    ),
                  ),
                  onChanged: (value) {
                    year = value!;
                  }),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: DropdownButtonFormField<String>(
                  decoration: SharedTextField.textFormInputDecoration(
                    label: "Expiry Month",
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Required';
                    }
                    return null;
                  },
                  // hint: Text("Type of Service "),
                  items: List.generate(
                    12,
                    (index) => DropdownMenuItem(
                      child: Text("${index + 1}"),
                      value: "${index + 1}",
                    ),
                  ),
                  onChanged: (value) {
                    month = value!;
                  }),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: DropdownButtonFormField<String>(
                  decoration: SharedTextField.textFormInputDecoration(
                    label: "Expiry Day",
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Required';
                    }
                    return null;
                  },
                  // hint: Text("Type of Service "),
                  items: List.generate(
                    31,
                    (index) => DropdownMenuItem(
                      child: Text("${index + 1}"),
                      value: "${index + 1}",
                    ),
                  ),
                  onChanged: (value) {
                    day = value!;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: 2.0.hp, top: 2.0.hp, left: 0.0.wp, right: 5.0.wp),
              child: Padding(
                padding: EdgeInsets.only(left: 5.0.wp),
                child: SharedTextField(
                    controller: addressController,
                    label: "Drivers Address",
                    keyBoardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) return "required!";
                    }),
              ),
            ),
            Container(
              width: 90.0.wp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await selectImage();
                      if (image != null) {
                        EasyLoading.show(
                          status: "Uploading... ",
                          maskType: EasyLoadingMaskType.black,
                          dismissOnTap: true,
                        );
                        await driverController.uploadLicense(image!);
                        EasyLoading.dismiss();
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: 1.0.hp,
                          top: 2.0.hp,
                          left: 5.0.wp,
                          right: 30.0.wp),
                      height: 50,
                      width: 50.0.wp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffDC143C)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.add,
                            color: Color(0xffDC143C),
                          ),
                          const SizedBox(width: 15),
                          Text("Upload License",
                              style: TextStyle(
                                  color: const Color(0xffDC143C),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0.sp)),
                        ],
                      ),
                    ),
                  ),
                  if (image != null)
                    Padding(
                      padding: EdgeInsets.only(right: 5.0.wp),
                      child: const Icon(Icons.done, color: Color(0xffDC143C)),
                    ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: 2.0.hp, top: 10.0.hp, left: 5.0.wp, right: 5.0.wp),
              height: 50,
              width: 90.0.wp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: const Color(0xffDC143C),
              ),
              child: TextButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (driverController.driverLicenseImageUrl.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Please upload your license",
                          icon: const Icon(Icons.error, color: Colors.white),
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Theme.of(context).primaryColor,
                          colorText: Colors.white,
                        );
                        return;
                      }
                      EasyLoading.show(
                        status: "Uploading... ",
                        maskType: EasyLoadingMaskType.black,
                        dismissOnTap: true,
                      );
                      await driverController.addDriverProfile(
                          licenseNumberController.text,
                          year,
                          month,
                          day,
                          addressController.text);
                      await EasyLoading.showSuccess(
                        "Congrats! your profile has been created",
                        duration: const Duration(seconds: 5),
                        maskType: EasyLoadingMaskType.black,
                        dismissOnTap: true,
                      ).then((value) {
                        Get.offAllNamed("/");
                      });
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
                    "Next",
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
    );
  }
}
