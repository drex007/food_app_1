import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/auth/controller/auth_controller.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_controller.dart';
import 'dart:io' as File;
import 'myMenuPage.dart';
import 'profilePage.dart';
import 'trofwalletPage.dart';

class AccountPage extends StatefulWidget {
  // final int? id;
  // final String? image
  // final String? Pickup;
  // final String? Delivery;
  AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final vendorController = Get.find<VendorController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDC143C),
        leading: Container(),
        title: Text(
          "Account",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.0.sp,
              color: Colors.white),
        ),
      ),
      body: Column(children: [
        //BackgroundStack
        Stack(children: [
          Container(
            width: 100.0.hp,
            height: 21.0.hp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Color(0xffDC143C),
            ),
          ),

          Center(
            child: Container(
                padding: EdgeInsets.only(top: 12.0.hp),
                margin: EdgeInsets.only(top: 8.8.hp, right: 2.0.wp),
                width: 88.8.wp,
                height: 22.0.hp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      //  offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      spreadRadius: -2.5,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    //Line
                    Container(
                      width: 88.8.wp,
                      height: 0.16.hp,
                      color: Colors.black12,
                    ),

                    SizedBox(
                      height: 3.12.wp,
                    ),

                    //PickUp and Delivery
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.56.wp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              Text(
                                "89",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text("Total Pickups",
                                  style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ]),
                            Column(children: [
                              Text("85",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text("Total Deliveries",
                                  style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            ])
                          ],
                        ))
                  ],
                )),
          ),

          // ProfilePicture and Name Column

          Column(
            children: [
              Center(
                child: Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.only(top: 2.5.hp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      // image:DecorationImage(image:profileImage.imageController !=null? : AssetImage("assets/images/profile/profile-pics.png"))
                    ),
                    //
                    child: vendorController.profileImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(75),
                            child: Image.file(
                              File.File(vendorController.profileImage!.path),
                              fit: BoxFit.cover,
                            ))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(75),
                            child: Image.asset(
                              "assets/images/profile/profile-pics.png",
                              fit: BoxFit.cover,
                            ))),
              ),
              SizedBox(height: 10),
              Text(
                "Brian David",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // ArrowbackROw
        ]),
        SizedBox(height: 3.12.hp),

        //Account Sections Container
        Container(
          padding: EdgeInsets.only(left: 8.0.wp),
          margin: EdgeInsets.only(left: 5.5.wp, right: 7.0.wp),
          height: 43.0.hp,
          width: 88.8.wp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 2.0,
                  spreadRadius: -2.5,
                )
              ]),
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => ProfilePage());
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/profile/myprofile.png",
                      scale: 3.0,
                    ),
                    SizedBox(width: 7.5.wp),
                    Text("Profile",
                        style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(height: 3.0.hp),
              GestureDetector(
                onTap: () {
                  Get.toNamed("/vendor_menu");
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/profile/mymenu.png",
                      scale: 3.0,
                    ),
                    SizedBox(width: 7.5.wp),
                    Text("Menu",
                        style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(height: 3.0.hp),
              GestureDetector(
                onTap: () {
                  Get.to(() => TrofWallet());
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/profile/trofwallet.png",
                      scale: 3.0,
                    ),
                    SizedBox(width: 7.5.wp),
                    Text("Payments",
                        style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(height: 3.0.hp),
              GestureDetector(
                onTap: () {
                  // Get.to(() => MainPage());
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/profile/mydrivers.png",
                      scale: 3.0,
                    ),
                    SizedBox(width: 7.5.wp),
                    Text("Drivers",
                        style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(height: 3.0.hp),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/profile/settings.png",
                      scale: 3.0,
                    ),
                    SizedBox(width: 7.5.wp),
                    Text("Settings",
                        style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(height: 3.0.hp),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/profile/help.png",
                      scale: 3.0,
                    ),
                    SizedBox(width: 7.5.wp),
                    Text("Help and Support",
                        style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(height: 3.0.hp),
              GestureDetector(
                onTap: () {
                  authController.logout();
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Image.asset(
                        "assets/images/profile/logout.png",
                        scale: 3.0,
                      ),
                    ),
                    SizedBox(width: 7.5.wp),
                    Text("Log Out",
                        style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(height: 3.0.hp),
            ],
          ),
        )
      ]),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //    BottomNavigationBarItem(title:Text("Hi") , icon: Icon(Icons.account_balance, color: Color(0xffDC143C)),),
      //    BottomNavigationBarItem(title:Text("Hi") , icon: Icon(Icons.account_balance, color: Color(0xffDC143C)),),
      //    BottomNavigationBarItem(title:Text("Hi") , icon: Icon(Icons.account_balance, color: Color(0xffDC143C)),),
      //    BottomNavigationBarItem(title:Text("Hi") , icon: Icon(Icons.account_balance, color: Color(0xffDC143C)),),
      //   ]
      //   ),
    );
  }
}
