import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';





class ToggleNotification extends StatefulWidget {
  const ToggleNotification({Key? key}) : super(key: key);

  @override
  _ToggleNotificationState createState() => _ToggleNotificationState();
}

class _ToggleNotificationState extends State<ToggleNotification> {
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
          "Notifications",
          style: TextStyle(
            color: Color(0xff363636),
            fontFamily: 'ProximaNova',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),

        child: Container(
          padding: EdgeInsets.all(10),
          width: 366,
          height: 216,
          child: Padding(
            padding: const EdgeInsets.all(20.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "App Notification",
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: (){

                        },
                        child:  Icon(
                          Icons.radio_button_checked,
                          color: Colors.red

                        ))
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Email Notification",
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(),
                      child: GestureDetector(
                          onTap: (){},
                          child:  Icon(
                            Icons.radio_button_checked,
                            color: Colors.red,
                          )),
                    )

                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Push Notification",
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding:  EdgeInsets.only(),
                      child: GestureDetector(
                          onTap: (){},
                          child:  Icon(
                            Icons.radio_button_off,
                            color: Colors.red,
                          )),
                    )

                  ],
                ),
              ],
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
      ),
    );
  }
}
