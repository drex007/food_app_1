import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';

import '../auth/controller/colorPicturesController.dart';
import '../vendorsDashboard/components/order_details_list.dart';

import '../vendorsDashboard/orders_tab.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with TickerProviderStateMixin {
  var tabs = ["All", "Pending", "Delivered", "Upcoming"];

  ColorPictureController tabColor = Get.find();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);

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
          "Orders",
          style: TextStyle(
              color: Color(0xff363636),
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
      body: Obx(() {
        return ListView(
          shrinkWrap: true,
          children: [
            TabBar(
                onTap: (int colorValue) {
                  tabColor.orderColor.value = colorValue;
                },
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.transparent,
                controller: _tabController,
                tabs: [
                  TabButtons(
                      tabTitle: "All",
                      textColor: tabColor.orderColor.value == 0
                          ? Colors.white
                          : Colors.black,
                      borderColor: tabColor.orderColor.value == 0
                          ? Color(0xffDC143C)
                          : Colors.white),
                  TabButtons(
                      tabTitle: "Pending",
                      textColor: tabColor.orderColor.value == 1
                          ? Colors.white
                          : Colors.black,
                      borderColor: tabColor.orderColor.value == 1
                          ? Color(0xffDC143C)
                          : Colors.white),
                  TabButtons(
                      tabTitle: "Delivered",
                      textColor: tabColor.orderColor.value == 2
                          ? Colors.white
                          : Colors.black,
                      borderColor: tabColor.orderColor.value == 2
                          ? Color(0xffDC143C)
                          : Colors.white),
                  TabButtons(
                      tabTitle: "Upcoming",
                      textColor: tabColor.orderColor.value == 3
                          ? Colors.white
                          : Colors.black,
                      borderColor: tabColor.orderColor.value == 3
                          ? Color(0xffDC143C)
                          : Colors.white),
                ]),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 96.0.wp,
              height: MediaQuery.of(context).size.height,
              child: TabBarView(controller: _tabController, children: [
                OrdersTab(),
                OrdersTab(),
                OrdersTab(),
                OrdersTab(),
              ]),
            ),
          ],
        );
      }),
    );
  }
}

class TabButtons extends StatelessWidget {
  final String tabTitle;
  final Color textColor;
  final Color borderColor;
  TabButtons({
    Key? key,
    required this.tabTitle,
    required this.textColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 29,
      child: Center(
        child: Text(
          tabTitle,
          style: TextStyle(
              color: textColor,
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 12),
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            // Todo: Add opacity(18)
            offset: Offset(1.0, 1.0),
            blurRadius: 10.0,
            spreadRadius: -5,
          ),
        ],
        borderRadius: BorderRadius.circular(6),
        color: borderColor,
      ),
    );
  }
}
