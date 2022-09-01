import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../auth/controller/colorPicturesController.dart';



class DateCard extends StatelessWidget {
  final String day;
  final String date;
  final int colorNo;

   DateCard({
    Key? key,
    required this.day,
    required this.date,
    required this.colorNo
  }) : super(key: key);

  ColorPictureController myTabcolor = Get.find();


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(5),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: TextStyle(
                color: myTabcolor.dashTabColor== this.colorNo ? Colors.white: Color(0xff363636),
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 7,),
            Text(
              date,
              style: TextStyle(
                color:myTabcolor.dashTabColor == this.colorNo ? Colors.white: Color(0xff363636),
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),

          ],
        ),
        height: 73,
        width: 73,
        decoration: BoxDecoration(
          color: myTabcolor.dashTabColor == this.colorNo ? Color(0xffDC143C) : Colors
              .white,

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
        ),
      );
    }
    );
  }
}
