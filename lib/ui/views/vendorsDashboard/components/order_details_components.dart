import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';

import '../textWidgets/commentBoxDialog.dart';
import '../textWidgets/customButtom.dart';
import '../textWidgets/customSmallButtons.dart';
import '../textWidgets/largeText.dart';
import '../textWidgets/mediumText.dart';
import 'find_driver_dialog.dart';

class DetailComponents extends StatelessWidget {
  final String dishName;
  final String imagePath;
  final String customerName;
  DetailComponents(
      {Key? key,
      required this.dishName,
      required this.imagePath,
      required this.customerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.0.wp),
      height: 100.0.hp,
      width: 100.0.wp,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView(
        children: [
          Container(
              // margin: EdgeInsets.only(top: 50),
              height: 50.0.hp,
              width: 100.0.wp,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("${imagePath}"), fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                color: Colors.white,
              ),
              child: Row(children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      margin: EdgeInsets.only(bottom: 30.0.hp, left: 15),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child:
                          Icon(Icons.arrow_back_ios, color: Color(0xffDC143C))),
                ),
              ])),
          SizedBox(height: 1.5.hp),
          Padding(
            padding: EdgeInsets.only(left: 8.0.wp),
            child: Row(
              children: [
                Text(
                  "Order details",
                  style: TextStyle(
                    color: Color(0xff363636),
                    fontFamily: 'ProximaNova',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.5.hp),
          Container(
            height: 30.0.hp,
            width: 90.0.wp,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                width: 90.0.wp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediumText(text: "Order ID", color: Colors.black),
                    MediumText(text: "R03132456", color: Colors.red),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                width: 90.0.wp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediumText(text: customerName, color: Colors.black),
                    SizedBox(height: 3),
                    MediumText(text: "08140113842", color: Colors.black),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 70,
                width: 90.0.wp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediumText(text: "Additions", color: Colors.black),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MediumText(text: "Chicken", color: Colors.black),
                        MediumText(text: "₦ 500", color: Colors.black),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MediumText(text: "Salad", color: Colors.black),
                        MediumText(text: "₦ 500", color: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LargeText(text: "Total"),
                    LargeText(text: "₦ 12,320")
                  ],
                ),
              )
            ]),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return FindDriverDialog();
                      });
                },
                child: CustomSmallButton(
                    buttonText: "Accept",
                    buttonColor: Color(0xffDC143C),
                    borderColor: Color(0xffDC143C),
                    textColor: Colors.white),
              ),
              SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CommentBox();
                      });
                },
                child: CustomSmallButton(
                    buttonText: "Reject",
                    buttonColor: Colors.white,
                    borderColor: Color(0xffDC143C),
                    textColor: Color(0xffDC143C)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
