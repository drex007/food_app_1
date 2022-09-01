import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trofira/ui/views/settings/languages.dart';
import 'package:trofira/ui/views/settings/notification.dart';

class SubSettings extends StatelessWidget {
  const SubSettings({Key? key}) : super(key: key);

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
          "Settings",
          style: TextStyle(
              color: Color(0xff363636),
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: 366,
              height: 48,
              child: Row(
                children: [
                  Text(
                    "Language",
                    style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding:  EdgeInsets.only(),
                    child: GestureDetector(
                        onTap: (){
                          showDialog(context: context, builder: (BuildContext) => Languages());
                        },
                        child:  Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xffB2B2B2),
                        )),
                  )
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
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Get.to(()=>ToggleNotification());
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: 366,
                height: 48,
                child: Row(
                  children: [
                    Text(
                      "Notification",
                      style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),
                    ),
                    Spacer(),
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
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}