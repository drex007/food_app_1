import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/models/error.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/core/utils/validators.dart';
import 'package:trofira/ui/views/auth/controller/auth_controller.dart';
import 'package:trofira/ui/views/widgets/shared_text_field.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  final authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  SignUp({Key? key}) : super(key: key);

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
            "Sign Up",
            style: TextStyle(
                color: Color(0xff363636),
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: SharedTextField(
                    controller: authController.firstNameController,
                    label: "First Name",
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: SharedTextField(
                    controller: authController.lastNameController,
                    label: "Last Name",
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: SharedTextField(
                      controller: authController.phoneNumberController,
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
                if (Get.arguments['userType'] == "vendor")
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 10),
                    child: SharedTextField(
                      controller:
                          authController.registeredBusinessLinkController,
                      label: "Registered Business link",
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: DropdownButtonFormField<String>(
                      decoration: SharedTextField.textFormInputDecoration(
                        label: "State",
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
                        authController.updateState(value!);
                      }),

                  // child: SharedTextField(
                  //   controller: authController.stateController,
                  //   label: "State",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Required';
                  //     }
                  //     return null;
                  //   },
                  // ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: Obx(() => SharedTextField(
                        controller: authController.confirmPasswordController,
                        obscureText:
                            authController.obscureConfirmPassword.value,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Checkbox(
                            value: authController.terms.value,
                            onChanged: (value) {
                              authController.toggleTerms();
                            }),
                      ),
                      SizedBox(
                        width: 300,
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'ProximaNova'),
                            children: [
                              TextSpan(
                                  text: "By Signing up, you agree to our ",
                                  style: TextStyle(color: Color(0xff363636))),
                              TextSpan(
                                  text: "Terms & Conditions ",
                                  style: TextStyle(color: Colors.redAccent)),
                              TextSpan(
                                  text: "and Privacy Policy",
                                  style: TextStyle(color: Color(0xff363636))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 6.0.hp,
                    child: TextButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (!authController.terms.value) {
                              Get.snackbar(
                                "Error",
                                "Please accept our terms and conditions",
                                icon: const Icon(Icons.error,
                                    color: Colors.white),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Theme.of(context).primaryColor,
                                colorText: Colors.white,
                              );
                              return;
                            }

                            EasyLoading.show(
                                status: "Loading... ",
                                maskType: EasyLoadingMaskType.black,
                                dismissOnTap: true);
                            try {
                              final response = await authController.signUp(
                                Theme.of(context).platform,
                                Get.arguments['userType'],
                              );
                              EasyLoading.dismiss();

                              await EasyLoading.showSuccess(response['message'],
                                      duration: const Duration(seconds: 5),
                                      dismissOnTap: true)
                                  .then((value) => {
                                        Get.offAllNamed("/verify_email",
                                            arguments: {
                                              'email': authController
                                                  .emailController.text
                                            })
                                      });
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(15),
                          )),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffDC143C)),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ProximaNova',
                            fontSize: 18,
                          ),
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'ProximaNova')),
                    GestureDetector(
                      onTap: () {
                        Get.offAndToNamed("/login");
                      },
                      child: const Text("  Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'ProximaNova',
                              color: Colors.redAccent)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
