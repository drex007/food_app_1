import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trofira/ui/views/auth/login_signup/forgot_password1.dart';

class OtpVerification2 extends StatelessWidget {
  const OtpVerification2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
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
            const Center(
              child: Text(
                "To confirm your account, enter the code that was sent to 09066772211.",
                style: TextStyle(
                    fontFamily: "ProximaNova",
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ),
            const SizedBox(height: 25),

                PinCodeTextField(
                    appContext: context, length: 4, onChanged: (value){
                      print(value);
                },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldWidth: 60.8,
                    fieldHeight: 58.81,
                    activeColor: Colors.green,
                    inactiveColor: Colors.red,
                    selectedFillColor: Colors.white,


                  ),

                ),

                /*Container(
                  width: 60.84,
                  height: 58.81,
                  child: const TextField(
                    textAlign: TextAlign.left,
                    cursorColor: Color(0xffB2B2B2),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      isDense: true,
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


                ),*/

            const SizedBox(height: 30),
            SizedBox(
              height: 48,
              width: 366,
              child: TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPassword1());
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
              onTap: () {
                //Get.to(() => const SignUp());
              },
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 15, fontFamily: 'ProximaNova'),
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
