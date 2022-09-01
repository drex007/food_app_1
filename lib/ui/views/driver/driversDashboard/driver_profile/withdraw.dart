import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/ui/views/widgets/shared_text_field.dart';




class Withdrawal extends StatelessWidget {
  const Withdrawal({Key? key}) : super(key: key);

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
          "Payments",
          style: TextStyle(
              color: Color(0xff363636),
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SharedTextField(
              label: "Enter Ammount to withdraw",
              controller: TextEditingController(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
              keyBoardType: TextInputType.text,

            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 48,
              width: 366,
              child: TextButton(
                  onPressed: () {
                    // action
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
                    "Withdraw",
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
