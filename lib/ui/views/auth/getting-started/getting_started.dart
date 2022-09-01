import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trofira/core/constants/assets_paths.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/vendorsDashboard/components/dashboard/page_controller.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  int _activeContainer = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Center(
              child: Text(
                "Welcome to Trofira!",
                style: TextStyle(
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Lets go through a few questions and steps to get your account setup",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: "ProximaNova",
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Please choose which applies to you",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _activeContainer = 0;
                });
              },
              child: Container(
                width: 85.0.wp,
                height: 13.0.hp,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                        width: 80.28,
                        height: 81.49,
                        child: SvgPicture.asset(AssetPaths.chef)),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "I am a food Vendor",
                      style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffababab),
                      // Todo: Add opacity(18)
                      offset: Offset(1.0, 1.0),
                      blurRadius: 10.0,
                      spreadRadius: -5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: _activeContainer == 0
                      ? const Color(0xffFAD1D9)
                      : Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _activeContainer = 1;
                });
              },
              child: Container(
                width: 85.0.wp,
                height: 13.0.hp,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                        width: 95.76,
                        height: 94,
                        child: SvgPicture.asset(AssetPaths.driver)),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "I am a Driver",
                      style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffababab),
                      // Todo: Add opacity(18)
                      offset: Offset(1.0, 1.0),
                      blurRadius: 10.0,
                      spreadRadius: -5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: _activeContainer == 1
                      ? const Color(0xffFAD1D9)
                      : Colors.white,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 48,
              width: 366,
              child: TextButton(
                  onPressed: () {
                    Get.toNamed('/signup', arguments: {
                      "userType": _activeContainer == 0 ? "vendor" : "driver"
                    });
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
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ProximaNova',
                      fontSize: 18,
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
