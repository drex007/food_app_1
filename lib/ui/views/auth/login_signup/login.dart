import 'package:flutter/material.dart';
import 'package:trofira/core/constants/assets_paths.dart';
import 'package:trofira/core/models/error.dart';
import 'package:trofira/core/utils/validators.dart';
import 'package:trofira/ui/views/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:trofira/ui/views/widgets/shared_text_field.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AssetPaths.logoRed),
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                      child: Text(
                        "Welcome to Trofira!",
                        style: TextStyle(
                            fontFamily: "ProximaNova",
                            color: Color(0xff363636),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/forgot_password');
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    SizedBox(
                      height: 48,
                      width: 366,
                      child: TextButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              EasyLoading.show(
                                  status: "Loading... ",
                                  maskType: EasyLoadingMaskType.black,
                                  dismissOnTap: true);
                              try {
                                await authController.signIn();
                                EasyLoading.dismiss();
                              } on Error catch (e) {
                                EasyLoading.dismiss();

                                if (e.data['verification'] != null &&
                                    e.data['verification'].length > 0) {
                                  return Get.offAndToNamed("/verify_email",
                                      arguments: {
                                        'email':
                                            authController.emailController.text
                                      });
                                }
                                EasyLoading.showError(e.message.toString(),
                                    maskType: EasyLoadingMaskType.black,
                                    duration: const Duration(seconds: 5),
                                    dismissOnTap: true);
                              }
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                            )),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xffDC143C)),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ProximaNova',
                              fontSize: 18,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/get-started');
                      },
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'ProximaNova'),
                          children: [
                            TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(color: Color(0xff363636))),
                            TextSpan(
                                text: "Sign up",
                                style: TextStyle(color: Colors.redAccent)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
