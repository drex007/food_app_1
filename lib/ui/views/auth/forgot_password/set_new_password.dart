import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:trofira/ui/views/auth/controller/auth_controller.dart';
import 'package:trofira/ui/views/widgets/shared_text_field.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({Key? key}) : super(key: key);

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  final authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();
  final String email = Get.arguments['email'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff363636)),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Set New Password",
          style: TextStyle(
              color: Color(0xff363636),
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Obx(() => SharedTextField(
                      controller: authController.passwordController,
                      obscureText: authController.obscurePassword.value,
                      label: "Password",
                      icon: IconButton(
                        onPressed: () {
                          authController.toggleObscurePassword();
                        },
                        icon: const Icon(
                          Icons.remove_red_eye,
                          color: Color(0xffB2B2B2),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                        if (value.length < 6) {
                          return 'password must be at least 6 characters';
                        }
                        return null;
                      },
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Obx(() => SharedTextField(
                      controller: authController.confirmPasswordController,
                      obscureText: authController.obscureConfirmPassword.value,
                      label: "Confirm Password",
                      icon: IconButton(
                        onPressed: () {
                          authController.toggleObscureConfirmPassword();
                        },
                        icon: const Icon(
                          Icons.remove_red_eye,
                          color: Color(0xffB2B2B2),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                        if (value != authController.passwordController.text) {
                          return 'passwords must match';
                        }
                        return null;
                      },
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 48,
                width: 366,
                child: TextButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await EasyLoading.show(
                          status: "Loading...",
                          maskType: EasyLoadingMaskType.black,
                          dismissOnTap: true,
                        );

                        await authController.setNewPassword(
                            email, authController.passwordController.text);
                        EasyLoading.dismiss();

                        await EasyLoading.showSuccess(
                          "New Password Set",
                          duration: const Duration(seconds: 2),
                          maskType: EasyLoadingMaskType.black,
                          dismissOnTap: true,
                        ).then((value) {
                          EasyLoading.dismiss();

                          Get.toNamed("/");
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
                      "Set New Password",
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
