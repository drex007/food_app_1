import 'package:flutter/material.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/core/utils/extensions.dart';

import '../auth/controller/colorPicturesController.dart';
import '../vendorsDashboard/components/order_details_components.dart';
import 'components/order_container.dart';
import 'components/order_container.dart' as orders;

import 'package:get/get.dart';
import '../../../core/constants/assets_paths.dart';

import 'components/date_card.dart';
import 'components/order_container.dart';
import 'components/order_details_list.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ColorPictureController myTabcolor = Get.find();

    TabController _tabcontroller = TabController(
      length: 4,
      vsync: this,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Column(
                    children: const [
                      Text(
                        "Welcome FoodZilla",
                        style: TextStyle(
                          color: Color(0xff363636),
                          fontFamily: 'ProximaNova',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Ready for today’s orders?",
                        style: TextStyle(
                          color: Color(0xff363636),
                          fontFamily: 'ProximaNova',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      icon: const Icon(Icons.notifications_none_outlined),
                      onPressed: () {
                        //  Get.to(()=>DocumentPage());
                      }),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                  height: 152,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /* SizedBox(
                        height: 104,
                          width: 144,
                          child: Image.asset(AssetPaths.baconChicken)),*/
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Total Orders",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "76",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      image: DecorationImage(
                        image: AssetImage(AssetPaths.backgroundGradient),
                        fit: BoxFit.cover,
                      ))),
              const SizedBox(
                height: 15,
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 1.0.wp),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          onTap: (index) {
                            myTabcolor.dashTabColor.value =
                                _tabcontroller.index;
                          },
                          labelPadding:
                              const EdgeInsets.only(left: 5, right: 5),
                          controller: _tabcontroller,
                          indicatorColor: Colors.white,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          tabs: [
                            DateCard(
                              day: "Today",
                              date: "11",
                              colorNo: 0,
                            ),
                            DateCard(
                              day: "Yesterday",
                              date: "9",
                              colorNo: 1,
                            ),
                            DateCard(
                              day: "This week",
                              date: "26",
                              colorNo: 2,
                            ),
                            DateCard(
                              day: "This month",
                              date: "62",
                              colorNo: 3,
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    height: 100.0.wp,
                    width: 90.0.hp,
                    child: TabBarView(
                      controller: _tabcontroller,
                      children: <Widget>[
                        Order(),
                        Order(),
                        Order(),
                        Order(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
