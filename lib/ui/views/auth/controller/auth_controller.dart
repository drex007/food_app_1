import 'dart:async';

// import 'package:trofira/ui/views/auth/controller/auth_repository.dart';

import 'package:dio/dio.dart';
import 'package:trofira/ui/views/auth/controller/auth_provider.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/models/user.dart';
import 'package:trofira/ui/views/auth/controller/auth_provider.dart';

import 'package:trofira/core/constants/trofira_enums.dart';

class AuthController extends GetxController {
  final appStatus = AppStatus.uninitialized.obs;
  // ignore: prefer_const_literals_to_create_immutables
  final user = User.fromJson({
    "_id": "",
    "firstName": "",
    "lastName": "",
    "email": "",
    "authStatus": "",
    "lock": "unlocked",
    "userType": "vendor",
    "emailVerified": false,
    "verified": false,
  }).obs;

  // text controller with fake data
  final firstNameController = TextEditingController(text: "Femi");
  final lastNameController = TextEditingController(text: "Bolaji");
  final phoneNumberController = TextEditingController(text: "08135571225");
  final emailController = TextEditingController(text: "femi@driver.com");
  final passwordController = TextEditingController(text: "abcd1234");
  final confirmPasswordController = TextEditingController(text: "abcd1234");
  final registeredBusinessLinkController =
      TextEditingController(text: "https://1234.com");
  final otpController = TextEditingController();
  // final firstNameController = TextEditingController();
  // final lastNameController = TextEditingController();
  // final phoneNumberController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  // final confirmPasswordController = TextEditingController();
  // final registeredBusinessLinkController = TextEditingController();
  // final otpController = TextEditingController();
  //
  RxBool obscurePassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;
  RxBool terms = false.obs;

  RxString state = "".obs;
  final AuthProvider authProvider;

  AuthController({required this.authProvider,
  //  required AuthRepository authRepository
   });

  @override
  void onInit() async {
    super.onInit();
    // logout();
    Timer(const Duration(seconds: 3), () {
      // check if user has already viewed onboarding
      bool hasSeenOnboarding = authProvider.checkIfUserViewedOnboarding();

      if (!hasSeenOnboarding) {
        appStatus.value = AppStatus.onboarding;
        return;
      }

      User? authenticatedUser = authProvider.getUser();

      if (authenticatedUser != null) {
        appStatus.value = AppStatus.authenticated;
        user.value = authenticatedUser;
        return;
      }
      appStatus.value = AppStatus.unauthenticated;
      return;
    });
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    registeredBusinessLinkController.dispose();
    otpController.dispose();
  }

  Future signUp(dynamic platform, String userType) async {
    final response = await authProvider.signUp({
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "phone": phoneNumberController.text.trim(),
      "state": state.value.trim(),
      "country": "nigeria",
      "registeredBusinessLink": registeredBusinessLinkController.text.trim(),
      "password": passwordController.text.trim(),
      "agreedToTerms": true,
      "device": platform.toString().split(".")[1].toLowerCase().trim(),
      "userType": userType.toLowerCase().trim()
    });
    // phoneNumberController.clear();
    // firstNameController.clear();
    // lastNameController.clear();
    // emailController.clear();
    // passwordController.clear();
    // confirmPasswordController.clear();
    // registeredBusinessLinkController.clear();

    return response;
  }

  void userHasSeenOnboarding() {
    authProvider.userHasSeenOnboarding();
  }

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleObscureConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  void toggleTerms() {
    terms.value = !terms.value;
  }

  void updateState(String value) {
    state.value = value;
  }

  Future resendVerifyEmailOTP() async {
    return await authProvider.resendVerifyEmailOTP();
  }

  Future requestPasswordResetOTP(String email) async {
    return await authProvider.requestPasswordResetOTP(email);
  }

  Future verifyEmailOTP(String code) async {
    final result = await authProvider.verifyEmailOTP(code);

    user.value = User.fromJson(result["data"]);
    await authProvider.storeUser(user.value);
    appStatus.value = AppStatus.authenticated;
    return result;
  }

  logout() async {
    await authProvider.logout();
    appStatus.value = AppStatus.unauthenticated;
  }

  Future signIn() async {
    final result = await authProvider.signIn(
        emailController.text, passwordController.text);

    if (result['status'] == 200) {
      user.value = User.fromJson(result["data"]);
      await authProvider.storeUser(user.value);
      appStatus.value = AppStatus.authenticated;
    }
    return result;
  }

  Future forgotPassword(String email) async {
    return await authProvider.forgotPassword(email);
  }

  Future verifyForgotPasswordOTP(String email, String code) async {
    return await authProvider.verifyForgotPasswordOTP(email, code);
  }

  Future setNewPassword(String email, String newPassword) async {
    return await authProvider.setNewPassword(email, newPassword);
  }

  Future getVendorProfileDetail() async {
    return await authProvider.getVendorProfileDetail();
  }
}
