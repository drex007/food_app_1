import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/driver/driversDashboard/listOfPickups.dart';
import 'package:trofira/ui/views/driver/driversDashboard/notifications.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_controller.dart';

class DriversDashboard extends StatefulWidget {
  const DriversDashboard({Key? key}) : super(key: key);

  @override
  State<DriversDashboard> createState() => _DriversDashboardState();
}

class _DriversDashboardState extends State<DriversDashboard>
    with TickerProviderStateMixin {
  final vendorController = Get.find<VendorController>();
  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.only(top: 1.0.hp, bottom: 1.0.hp, left: 3.0.wp),
          height: 30,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
          ),
          child: Image.asset("assets/images/profile/richman.png",
              fit: BoxFit.cover),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text(
              "Welcome Richman",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "ProximaNova"),
            ),
            Text(
              "Ready for today's delivery? ",
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "ProximaNova"),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 3.0.wp),
            child: InkWell(
                onTap: () {
                  Get.to(() => Notifications());
                },
                child: Image.asset(
                  "assets/images/profile/bell.png",
                  scale: 4.0,
                )),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.only(left: 3.0.wp),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  onTap: (index) {
                    vendorController.myColor.value = _tabcontroller.index;
                  },
                  labelPadding: const EdgeInsets.only(left: 5, right: 5),
                  controller: _tabcontroller,
                  indicatorColor: Colors.white,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  tabs: [
                    MyTabBar(
                      day: "Today",
                      date: "11",
                      amount: "₦ 25,000",
                      colorNum: 0,
                    ),
                    MyTabBar(
                      day: "Yesterday",
                      date: "5",
                      amount: "₦ 16,000",
                      colorNum: 1,
                    ),
                    MyTabBar(
                      day: "This Week",
                      date: "26",
                      amount: "₦ 62,000",
                      colorNum: 2,
                    ),
                    MyTabBar(
                      day: "This month",
                      date: "62",
                      amount: "₦ 80,000",
                      colorNum: 3,
                    )
                  ]),
            ),
          ),
          Container(
            // margin: EdgeInsets.only(left: 5.0.wp),
            height: 90.0.hp,
            width: 90.0.wp,
            child: TabBarView(
              controller: _tabcontroller,
              children: <Widget>[
                ListOfPickUps(
                    imagePath: "assets/images/profile/",
                    restruantName: "FoodZilla",
                    location: "No 22 Tudun Wada, Angwan clinic Jos",
                    datetime: "9.00 AM March 21, 2020"),
                ListOfPickUps(
                    imagePath: "assets/images/profile/",
                    restruantName: "FoodZilla",
                    location: "No 22 Tudun Wada, Angwan clinic Jos",
                    datetime: "9.00 AM March 21, 2020"),
                ListOfPickUps(
                    imagePath: "assets/images/profile/",
                    restruantName: "FoodZilla",
                    location: "No 22 Tudun Wada, Angwan clinic Jos",
                    datetime: "9.00 AM March 21, 2020"),
                ListOfPickUps(
                    imagePath: "assets/images/profile/",
                    restruantName: "FoodZilla",
                    location: "No 22 Tudun Wada, Angwan clinic Jos",
                    datetime: "9.00 AM March 21, 2020"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyTabBar extends StatelessWidget {
  final String day;
  final String date;
  final String amount;
  final int colorNum;
  MyTabBar(
      {Key? key,
      required this.day,
      required this.date,
      required this.amount,
      required this.colorNum})
      : super(key: key);

  final vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 14.0.hp,
        width: 24.0.wp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: vendorController.myColor.value == colorNum
              ? Color(0xffDC143C)
              : Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: -6,
            )
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              this.day.toString(),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "ProximaNova",
                  color: vendorController.myColor.value == colorNum
                      ? Colors.white.withOpacity(0.8)
                      : Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              date.toString(),
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: vendorController.myColor.value == colorNum
                      ? Colors.white
                      : Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              this.amount.toString(),
              style: TextStyle(
                  color: vendorController.myColor.value == colorNum
                      ? Colors.white.withOpacity(0.8)
                      : Colors.black),
            ),
          ],
        ),
      );
    });
  }
}
