import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/constants/assets_paths.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/auth/controller/auth_controller.dart';
import 'package:trofira/ui/views/settings/settings.dart';

import '..//driver_profile/profile.dart';
import '..//driver_profile/payments.dart';

class DriverAccount extends StatefulWidget {
  const DriverAccount({Key? key}) : super(key: key);

  @override
  _DriverAccountState createState() => _DriverAccountState();
}

class _DriverAccountState extends State<DriverAccount> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        //BackgroundStack
        Stack(children: [
          Container(
            width: 100.0.hp,
            height: 36.0.hp,
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
                margin: EdgeInsets.only(top: 23.8.hp, right: 2.0.wp),
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
                    margin: EdgeInsets.only(top: 17.5.hp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      // image:DecorationImage(image:profileImage.imageController !=null? : AssetImage("assets/images/profile/profile-pics.png"))
                    ),
                    //
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: Image.asset(
                          AssetPaths.driverProfilePicture,
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
          Container(
            padding: EdgeInsets.only(top: 7.8.hp, left: 6.94.wp),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white)),
                SizedBox(
                  width: 27.0.wp,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0.sp,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ]),
        SizedBox(height: 3.12.hp),

        //Account Sections Container
        Container(
          padding: EdgeInsets.only(left: 8.0.wp),
          margin: EdgeInsets.only(left: 5.5.wp, right: 7.0.wp),
          height: 40.0.hp,
          width: 88.8.wp,
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
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => DriverProfile());
                },
                child: Row(
                  children: [
                    Image.asset(AssetPaths.profile),
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
                  Get.to(() => Payments());
                },
                child: Row(
                  children: [
                    Image.asset(AssetPaths.payments),
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
                  Get.to(() => const Settings());
                },
                child: Row(
                  children: [
                    Image.asset(AssetPaths.settings),
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
                onTap: () {
                  //Get.to(()=>());
                },
                child: Row(
                  children: [
                    Image.asset(AssetPaths.reviews),
                    SizedBox(width: 7.5.wp),
                    Text("Reviews",
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
                    Image.asset(AssetPaths.support),
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
                    Image.asset(AssetPaths.logout),
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
    );
  }
}
