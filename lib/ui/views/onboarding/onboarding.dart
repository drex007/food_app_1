import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trofira/core/constants/assets_paths.dart';
import 'package:trofira/core/constants/trofira_strings.dart';
import 'package:trofira/ui/views/auth/controller/auth_controller.dart';
import 'package:trofira/core/utils/extensions.dart';

class Onboarding extends StatelessWidget {
  final authController = Get.find<AuthController>();

  Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
          showDoneButton: false,
          pages: [
            PageViewModel(
              title: TrofiraStrings.onboarding1Title,
              body: TrofiraStrings.onboarding1Body,
              image: SizedBox(
                  width: 70.0.wp,
                  height: 30.0.hp,
                  child: SvgPicture.asset(AssetPaths.getOrders)),
            ),
            PageViewModel(
              title: TrofiraStrings.onboarding2Title,
              body: TrofiraStrings.onboarding2Body,
              image: SizedBox(
                width: 70.0.wp,
                height: 30.0.hp,
                child: SvgPicture.asset(AssetPaths.boostSales),
              ),
            ),
            PageViewModel(
                title: TrofiraStrings.onboarding3Title,
                body: TrofiraStrings.onboarding3Body,
                image: SizedBox(
                  width: 70.0.wp,
                  height: 30.0.hp,
                  child: SvgPicture.asset(AssetPaths.deliverEarn),
                ),
                footer: Column(
                  children: [
                    SizedBox(
                      height: 10.0.hp,
                    ),
                    SizedBox(
                      height: 48,
                      width: 80.0.wp,
                      child: TextButton(
                          onPressed: () {
                            authController.userHasSeenOnboarding();
                            Get.toNamed("/get-started");
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
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ProximaNova',
                              fontSize: 18,
                            ),
                          )),
                    ),
                  ],
                )),
          ],
          next: const Text(
            "Next",
            style:
                TextStyle(color: Color(0xff363636), fontFamily: 'ProximaNova'),
          )),
    );
  }

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'ProximaNova'),
        bodyTextStyle: const TextStyle(fontSize: 16, fontFamily: 'ProximaNova'),
        descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
        pageColor: const Color(0xffE5E5E5),
      );
}
