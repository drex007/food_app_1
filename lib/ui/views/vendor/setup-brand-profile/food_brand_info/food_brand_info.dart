import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_controller.dart';
import 'package:trofira/ui/views/widgets/shared_text_field.dart';

class BrandInfo extends StatelessWidget {
  BrandInfo({Key? key}) : super(key: key);

  final vendorController = Get.find<VendorController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Vendor Brand Info",
          style: TextStyle(
              color: Color(0xff363636),
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Tell your customers as much as possible about your wonderful food brand!.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                          text: "Basic Info  ",
                          style: TextStyle(color: Color(0xff363636))),
                      TextSpan(
                          text: "*", style: TextStyle(color: Colors.redAccent)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: SharedTextField(
                  controller: vendorController.vendorNameController,
                  label: "Brand Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  keyBoardType: TextInputType.text,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: DropdownButtonFormField<String>(
                    decoration: SharedTextField.textFormInputDecoration(
                      label: "Select State",
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Required';
                      }
                      return null;
                    },
                    // hint: Text("Type of Service "),
                    items: const [
                      DropdownMenuItem(
                        child: Text('Plateau'),
                        value: 'plateau',
                      ),
                    ],
                    onChanged: (value) {
                      vendorController.updateState(value!);
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                          text: "Contacts  ",
                          style: TextStyle(color: Color(0xff363636))),
                      TextSpan(
                          text: "*", style: TextStyle(color: Colors.redAccent)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          text: "* ",
                          style: TextStyle(color: Colors.redAccent)),
                      TextSpan(
                          text:
                              "This number will be publicly visible to the consumers.",
                          style: TextStyle(color: Color(0xff363636))),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: SharedTextField(
                    controller: vendorController.phoneNumberController,
                    label: "Phone number",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      }
                      if (value.length < 11) {
                        return 'Invalid phone number';
                      }
                      return null;
                    },
                    keyBoardType: TextInputType.number),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: SharedTextField(
                  controller: vendorController.vendorAddressController,
                  label: "Address",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  keyBoardType: TextInputType.text,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                          text: "Social Media  ",
                          style: TextStyle(color: Color(0xff363636))),
                      TextSpan(
                          text: "* ",
                          style: TextStyle(color: Colors.redAccent)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          text: "* ",
                          style: TextStyle(color: Colors.redAccent)),
                      TextSpan(
                          text:
                              "Enter your social media account’s ID/Name, not the full URL.",
                          style: TextStyle(color: Color(0xff363636))),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: SharedTextField(
                  controller: vendorController.vendorFacebookIdController,
                  label: "Facebook ID",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  keyBoardType: TextInputType.text,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: SharedTextField(
                  controller: vendorController.vendorInstagramIdController,
                  label: "Instagram ID",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  keyBoardType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: 48,
                width: 366,
                child: TextButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        Get.toNamed("/add_logo");
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
                      "Proceed",
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
