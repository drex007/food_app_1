import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff363636)),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Reset Password",
          style: TextStyle(
              color: Color(0xff363636),
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
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
                  hintText: 'New Password',
                  alignLabelWithHint: true,
                  hintStyle: TextStyle(
                    color: Color(0xffB2B2B2),
                    fontFamily: 'ProximaNova',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(),
                    child: Icon(Icons.remove_red_eye, color: Color(0xffB2B2B2)),
                  ),
                ),
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
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
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
                    hintText: 'Confirm New Password',
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(
                      color: Color(0xffB2B2B2),
                      fontFamily: 'ProximaNova',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(),
                      child: Icon(
                        Icons.remove_red_eye,
                        color: Color(0xffB2B2B2),
                      ),
                    )),
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
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 48,
              width: 366,
              child: TextButton(
                  onPressed: () {
                    // Get.to(() => const Login());
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
                    "Confirm",
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
    );
  }
}
