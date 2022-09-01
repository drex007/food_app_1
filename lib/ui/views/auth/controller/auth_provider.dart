import 'package:dio/dio.dart';
import 'package:trofira/core/models/error.dart';
import 'package:trofira/core/models/user.dart';
import 'package:trofira/core/services/api/api_service.dart';
import 'package:get/get.dart';
import 'package:trofira/core/services/api/endpoints.dart';
import 'package:trofira/core/services/storage/storage.dart';
import 'package:trofira/core/services/storage/storage_keys.dart';

class AuthProvider {
  final StorageService storageService = Get.find<StorageService>();
  final ApiService apiService = Get.find<ApiService>();

  bool checkIfUserViewedOnboarding() {
    return storageService.read(TrofiraStorageKeys.hasSeenOnboarding) ?? false;
  }

  void userHasSeenOnboarding() {
    storageService.write(TrofiraStorageKeys.hasSeenOnboarding, true);
  }

  User? getUser() {
    if (storageService.read(TrofiraStorageKeys.user) != null) {
      final result = storageService.decode(TrofiraStorageKeys.user);
      return User.fromJson(result);
    }
    return null;
  }

  Future signUp(Map<String, dynamic> data) async {
    final result =
        await apiService.httpPostCall(endpoint: Endpoints.signUp, data: data);

    // request opt
    //store token in case we need to call resend endpoint
    storageService.write(TrofiraStorageKeys.authToken, result["token"]);
    await apiService.sendVerifyEmailOTP(result["token"]);
    return result;
  }

  Future resendVerifyEmailOTP() async {
    return await apiService
        .sendVerifyEmailOTP(storageService.read(TrofiraStorageKeys.authToken));
  }

  Future verifyEmailOTP(String code) async {
    final result = await apiService.verifyEmailOTP(code);
    //save main token to storage
    storageService.write(TrofiraStorageKeys.token, result["token"]);
    return result;
  }

  Future storeUser(User user) async {
    return await storageService.encode(TrofiraStorageKeys.user, user.toJson());
  }

  Future logout() async {
    return apiService.logout();
  }

  Future signIn(String email, String password) async {
    try {
      final result = await apiService.httpPostCall(
          endpoint: Endpoints.signIn,
          data: {"email": email, "password": password});

      storageService.write(TrofiraStorageKeys.token, result['token']);
      return result;
    } on Error catch (e) {
      //if user has email uverified, send otp
      if (e.data['status'] == 403) {
        await apiService.sendVerifyEmailOTP(e.data['token']);
        //incase user needs to get new token
        storageService.write(TrofiraStorageKeys.authToken, e.data['token']);
      }
      rethrow;
    }
  }

  Future requestPasswordResetOTP(String email) async {
    return await apiService.httpGetCall(
        endpoint: Endpoints.verifyOTP, extraParams: {"email": email});
  }

  Future verifyForgotPasswordOTP(String email, String code) async {
    try {
      final result = await apiService.httpPostCall(
          endpoint: Endpoints.verifyForgotPasswordOTP,
          data: {"email": email, "code": code});
      //TODO: save returned OTP here

      print(result);
      storageService.write(
          TrofiraStorageKeys.forgotPasswordToken, result['resetToken']);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future setNewPassword(String email, String newPassword) async {
    final result = await apiService.httpPostCall(
      endpoint: Endpoints.setNewPassword +
          "?token=${storageService.read(TrofiraStorageKeys.forgotPasswordToken)}&email=&$email",
      data: {
        "password": newPassword,
      },
    );
  }

  Future getVendorProfileDetail() async {
    return apiService.secureHttpGetCall(
        endpoint: Endpoints.getVendorProfileDetails);
  }

  Future forgotPassword(String email) async {
    final result = await apiService.httpPostCall(
        endpoint: Endpoints.sendForgotPasswordOTP, data: {"email": email});
    print("---------------");
    print("-----------");
    print("--------");
    print("-----");
    print("--");
    print("forgot password");
    print(result);
    return result;
  }
}
