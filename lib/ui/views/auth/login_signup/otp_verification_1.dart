import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/ui/views/auth/login_signup/otp_verification_2.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({Key? key}) : super(key: key);

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
        title: const Text("Otp Verification", style: TextStyle(color: Color(0xff363636), fontFamily: 'ProximaNova', fontWeight: FontWeight.w600, fontSize: 18),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              const Center(
                child: Text("Enter your phone number below, a ONE TIME PASSWORD will be sent to the phone number.",
                  style: TextStyle(fontFamily: "ProximaNova", fontWeight: FontWeight.w400, fontSize: 14),),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 366,
                height: 48,
                child: const TextField(
                  textAlign: TextAlign.left,
                  cursorColor: Color(0xffB2B2B2),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      isDense: true,
                      hintText: 'Phone Number', alignLabelWithHint: true,
                      hintStyle: TextStyle(color: Color(0xffB2B2B2), fontFamily: 'ProximaNova', fontSize: 14, fontWeight: FontWeight.w400, ),
                      border: InputBorder.none,
                  ),
                ),
                decoration: BoxDecoration(
                  boxShadow:const [
                    BoxShadow(
                      color: Color(0xffababab),
                      // Todo: Add opacity(18)
                      offset: Offset(1.0, 1.0),
                      blurRadius: 10.0,
                      spreadRadius: -5,
                    ),],

                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),


              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 48, width: 366,
                child: TextButton(
                    onPressed: () {
                      Get.to(() => const OtpVerification2());
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(15),
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          const Color(0xffDC143C)),

                    ),
                    child: const Text(
                      "Generate OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'ProximaNova',
                        fontSize: 18,
                      ),)),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
