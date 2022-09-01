import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_controller.dart';

class WithdrawalPage extends StatefulWidget {
  const WithdrawalPage({Key? key}) : super(key: key);

  @override
  State<WithdrawalPage> createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
  final vendorController = Get.find<VendorController>();

  @override
  Widget build(BuildContext context) {
    String selectedBank = "GT";
    String image = "assets/images/profile/gtbank.png";
    TextEditingController accountNumberController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    TextEditingController messageController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Withdraw",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "ProximaNova"),
          ),
        ),
        body: Container(
          height: 100.0.hp,
          width: 100.0.wp,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
            child: ListView(
              children: [
                SizedBox(
                  height: 3.5.hp,
                ),
                Text(
                  "Select bank ",
                  style: TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w600,
                      fontSize: 10.0.sp),
                ),
                SizedBox(
                  height: 4.0.hp,
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 2.0.hp),
                    height: 50,
                    width: 90.0.wp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: -4,
                            blurRadius: 6,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: vendorController.bankSelectedLogo == null
                                  ? Image.asset(image, scale: 5.0)
                                  : Image.asset(vendorController.bankSelectedLogo,
                                      scale: 5.0),
                            ),
                            SizedBox(width: 10),
                            if (vendorController.bankSelected == null)
                              Text(selectedBank)
                            else
                              Text(vendorController.bankSelected),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Builsheet();
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.keyboard_arrow_down),
                          ),
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(bottom: 2.0.hp),
                  height: 50,
                  width: 90.0.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: -4,
                          blurRadius: 6,
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0.wp),
                    child: TextField(
                      controller: accountNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        iconColor: Color(0xffDC143C),
                        border: InputBorder.none,
                        hintText: "Enter Account Number",
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 2.0.hp),
                  height: 50,
                  width: 90.0.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: -4,
                          blurRadius: 6,
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0.wp),
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        iconColor: Color(0xffDC143C),
                        border: InputBorder.none,
                        hintText: "₦  Amount",
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 90.0.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: -4,
                          blurRadius: 6,
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0.wp),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        iconColor: Color(0xffDC143C),
                        border: InputBorder.none,
                        hintText: "Message(Optional)",
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.to();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 9.0.hp),
                    height: 8.0.hp,
                    width: 90.0.wp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: Color(0xffDC143C),
                    ),
                    child: Center(
                        child: Text("Transfer",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70.0.hp, left: 25.0.wp),
                  padding: EdgeInsets.only(bottom: 10.0.hp),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/profile/sec.png",
                          scale: 4.0,
                        ),
                        SizedBox(width: 2.0.wp),
                        Text("Secured by"),
                        SizedBox(width: 1.0.wp),
                        Text("Trofira",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget Builsheet() {
    final vendorController = Get.find<VendorController>();

    var mybanks = {
      "GT": "assets/images/profile/gtbank.png",
      "FCMB": "assets/images/profile/fcmb.png",
      "First bank": "assets/images/profile/firstbank.png",
      "Eco bank": "assets/images/profile/ecobank.png",
      "Access": "assets/images/profile/accessbank.png",
      "Keystone": "assets/images/profile/keystone.png",
    };
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.6,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          padding: EdgeInsets.all(16),
          child: ListView.builder(
              itemCount: mybanks.length,
              controller: controller,
              itemBuilder: (_, int index) {
                return Obx(() => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      mybanks.values.elementAt(index),
                                      scale: 4.0,
                                    ),
                                    SizedBox(width: 10),
                                    Text(mybanks.keys.elementAt(index)),
                                  ],
                                ),
                                Radio(
                                    value: index == 0 ? 0 : index + 1,
                                    groupValue:
                                        vendorController.bankValue.value,
                                    activeColor: Color(0xffDC143C),
                                    onChanged: (value) {
                                      setState(() {
                                        vendorController.bankValue.value =
                                            value as int;

                                        if (value == 0) {
                                          vendorController.bankSelected =
                                              mybanks.keys
                                                  .elementAt(value as int);
                                          vendorController.bankSelectedLogo =
                                              mybanks.values
                                                  .elementAt(value as int);
                                        } else {
                                          vendorController.bankSelected =
                                              mybanks.keys.elementAt(
                                                  (value as int) - 1);
                                          vendorController.bankSelectedLogo =
                                              mybanks.values.elementAt(
                                                  (value as int) - 1);
                                        }
                                        Navigator.pop(context);
                                      });
                                    })
                              ]),
                        ),
                        Container(
                          height: 1,
                          width: 100.0.wp,
                          color: Colors.black12,
                        ),
                      ],
                    ));
              }),
        );
      },
    );
  }
}
