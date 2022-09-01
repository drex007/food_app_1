import 'dart:ui';
import 'dart:io';
import 'dart:async';
import 'dart:io' as File;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:trofira/core/utils/extensions.dart';
// import 'package:troffira/controller/profileImage.dart';
import '../controller/vendor_controller.dart';
import 'accountPage.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:troffira/ui/views/account/accountPage.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final vendorController = Get.find<VendorController>();
  
// ProfileImage selectedImage = Get.find();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
              setState(() {});
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 14.0.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: "ProximaNova"),
        ),
        actions: [
          Image.asset(
            "assets/images/profile/edit-image.png",
            scale: 3.0,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: 100.0.wp,
        child: ListView(children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 2.0.wp, top: 3.0.hp, right: 2.0.wp),
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: vendorController.profileImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              File.File(vendorController.profileImage!.path),
                              fit: BoxFit.cover,
                            ))
                        : Image.asset(
                            "assets/images/profile/profile-pics.png",
                            fit: BoxFit.cover,
                          ),
                  ),
                  // ChangeProfile conatiner
                  Container(
                    margin: EdgeInsets.only(top: 160, left: 120),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade100,
                    ),
                    child: InkWell(
                      onTap: () async {
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          vendorController.profileImage = image;
                        });
                      },
                      child: Icon(
                        Icons.camera_alt,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.0.hp),
              GestureDetector(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 5.0.wp, right: 5.0.wp, bottom: 1.5.hp),
                      padding: EdgeInsets.only(left: 6.0.wp, top: 2.5.hp),
                      width: 90.0.wp,
                      height: 8.0.hp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: -3,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        "Brian David",
                        style: TextStyle(
                            fontSize: 15.0.sp,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
              GestureDetector(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 5.0.wp, right: 5.0.wp, bottom: 1.5.hp),
                      padding: EdgeInsets.only(left: 6.0.wp, top: 2.5.hp),
                      width: 90.0.wp,
                      height: 8.0.hp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: -3,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        "briandavid@gmail.com",
                        style: TextStyle(
                            fontSize: 15.0.sp,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
              GestureDetector(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 5.0.wp, right: 5.0.wp, bottom: 1.5.hp),
                      padding: EdgeInsets.only(left: 6.0.wp, top: 2.5.hp),
                      width: 90.0.wp,
                      height: 8.0.hp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: -3,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 15.0.sp,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
              GestureDetector(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 5.0.wp, right: 5.0.wp, bottom: 1.5.hp),
                      padding: EdgeInsets.only(left: 6.0.wp, top: 2.5.hp),
                      width: 90.0.wp,
                      height: 8.0.hp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: -3,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        "State",
                        style: TextStyle(
                            fontSize: 15.0.sp,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
              GestureDetector(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 5.0.wp, right: 5.0.wp, bottom: 1.5.hp),
                      padding: EdgeInsets.only(left: 6.0.wp, top: 2.5.hp),
                      width: 90.0.wp,
                      height: 8.0.hp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: -3,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        "Country",
                        style: TextStyle(
                            fontSize: 15.0.sp,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0.wp),
                    child: Text("Change Password?",
                        style: TextStyle(
                          color: Color(0xffDC143C),
                          fontWeight: FontWeight.w400,
                          fontFamily: "ProximaNova",
                        )),
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}
