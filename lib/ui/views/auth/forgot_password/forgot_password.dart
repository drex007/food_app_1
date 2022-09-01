import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/validators.dart';
import 'package:trofira/ui/views/auth/controller/auth_controller.dart';
import 'package:trofira/ui/views/widgets/shared_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    ;
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
          "Forgot Password",
          style: TextStyle(
              color: Color(0xff363636),
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text(
                      "Enter your email address below. A code will be sent to the email address.",
                      style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: SharedTextField(
                    controller: authController.emailController,
                    label: "Email",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required';
                      }
                      if (!Validators.isValidEmail(value)) {
                        return "Please Enter a Valid Email";
                      }
                      return null;
                    },
                    keyBoardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 48,
                  width: 366,
                  child: TextButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            await EasyLoading.show(
                              status: "Sending OTP...",
                              maskType: EasyLoadingMaskType.black,
                            );

                            final result = await authController.forgotPassword(
                                authController.emailController.text);
                            EasyLoading.dismiss();

                            await EasyLoading.showSuccess(
                              "OTP sent to email",
                              duration: const Duration(seconds: 2),
                              maskType: EasyLoadingMaskType.black,
                              dismissOnTap: true,
                            ).then((value) => {
                                  Get.offAllNamed("/forgot_password_otp",
                                      arguments: {
                                        'email':
                                            authController.emailController.text
                                      })
                                });
                          } catch (e) {
                            EasyLoading.dismiss();

                            EasyLoading.showError("error",
                                maskType: EasyLoadingMaskType.black,
                                duration: const Duration(seconds: 5),
                                dismissOnTap: true);
                          }
                        }
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(15),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffDC143C)),
                      ),
                      child: const Text(
                        "Send",
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
      ),
    );
  }
}
