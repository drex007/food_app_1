import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trofira/core/models/error.dart';
import 'package:trofira/ui/views/auth/controller/auth_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EmailOtpVerification extends StatefulWidget {
  const EmailOtpVerification({Key? key}) : super(key: key);

  @override
  State<EmailOtpVerification> createState() => _EmailOtpVerificationState();
}

class _EmailOtpVerificationState extends State<EmailOtpVerification> {
  final authController = Get.find<AuthController>();
  String timerText = "00:00:00";
  late Timer _timer;

  @override
  initState() {
    super.initState();
    startCountdownTimer();
  }

  startCountdownTimer() {
    int countdownTime = (10 * 60 * 1000);
    // runs every 1 second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final int timeElapsed = countdownTime - timer.tick * 1000;
      final int minutes =
          ((timeElapsed % (1000 * 60 * 60)) / (1000 * 60)).floor();
      final int seconds = ((timeElapsed % (1000 * 60)) / 1000).floor();
      setState(() {
        String mDisplay =
            "${minutes < 10 ? "0" + minutes.toString() : minutes}";
        String sDisplay =
            "${seconds < 10 ? "0" + seconds.toString() : seconds}";
        timerText = "00:$mDisplay:$sDisplay";
      });
      if (timeElapsed < 0) {
        timer.cancel();
        setState(() {
          timerText = "00:00:00";
        });
      }
    });
  }

  void verifyCode(String code) async {
    if (code.isEmpty) return;
    try {
      await EasyLoading.show(
        status: "Loading...",
        maskType: EasyLoadingMaskType.black,
      );

      await authController.verifyEmailOTP(code);
      EasyLoading.dismiss();

      await EasyLoading.showSuccess(
        "Congrats! your email has been verified",
        duration: const Duration(seconds: 5),
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      ).then((value) {
        _timer.cancel();
        Get.offAllNamed("/");
      });
    } on Error catch (e) {
      EasyLoading.dismiss();

      EasyLoading.showError(e.message,
          maskType: EasyLoadingMaskType.black,
          duration: const Duration(seconds: 5),
          dismissOnTap: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back, color: Color(0xff363636)),
          //   onPressed: () => Get.back(),
          // ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Otp Verification",
            style: TextStyle(
                color: Color(0xff363636),
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "To confirm your account, enter the code that was sent to ${Get.arguments['email']}.",
                style: const TextStyle(
                    fontFamily: "ProximaNova",
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) {},
                onCompleted: (value) {
                  // verifyCode(value);
                },
                showCursor: false,
                cursorColor: Theme.of(context).primaryColor,
                controller: authController.otpController,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldOuterPadding: const EdgeInsets.all(0),
                    fieldWidth: 35,
                    fieldHeight: 55,
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: Theme.of(context).primaryColor,
                    selectedFillColor: Colors.white,
                    activeFillColor: Theme.of(context).primaryColor),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 48,
              width: 366,
              child: TextButton(
                  onPressed: () {
                    verifyCode(authController.otpController.text);
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
                    "Verify Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ProximaNova',
                      fontSize: 18,
                    ),
                  )),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                if (timerText == "00:00:00") {
                  try {
                    await EasyLoading.show(
                      status: "Loading...",
                      maskType: EasyLoadingMaskType.black,
                    );
                    await authController.resendVerifyEmailOTP();
                    startCountdownTimer();
                    await EasyLoading.showSuccess(
                        "Code Sent. Please check your email",
                        duration: const Duration(seconds: 5),
                        maskType: EasyLoadingMaskType.black,
                        dismissOnTap: true);
                  } on Error catch (e) {
                    EasyLoading.dismiss();

                    if (e.statusCode == 401) {
                      _timer.cancel();
                      return Get.offAndToNamed("/");
                    }
                    EasyLoading.showError(e.message.toString(),
                        maskType: EasyLoadingMaskType.black,
                        duration: const Duration(seconds: 5),
                        dismissOnTap: true);
                  }
                }
              },
              child: timerText != "00:00:00"
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Request for new OTP in " + timerText,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : RichText(
                      text: const TextSpan(
                        style:
                            TextStyle(fontSize: 15, fontFamily: 'ProximaNova'),
                        children: [
                          TextSpan(
                              text: "Haven't gotten a code?  ",
                              style: TextStyle(color: Color(0xff363636))),
                          TextSpan(
                              text: "Get new code",
                              style: TextStyle(color: Colors.redAccent)),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
