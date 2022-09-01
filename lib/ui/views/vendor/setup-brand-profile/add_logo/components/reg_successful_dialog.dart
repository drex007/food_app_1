import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

// import '../../../dash_board/dashboard.dart';

class Successful extends StatefulWidget {
  const Successful({Key? key}) : super(key: key);

  @override
  State<Successful> createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      elevation: 0,
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 580,
            width: 335,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Image.asset(
                      "assets/images/Animations/Reg_success/Success.png"),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: const [
                    Center(
                        child: Text(
                      "Awesome!!",
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      "Your registration was successful!",
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.offAndToNamed("/");
                      },
                      child: const Text(
                        "OK",
                        style: TextStyle(
                          color: Color(0xff363636),
                          fontFamily: 'ProximaNova',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
