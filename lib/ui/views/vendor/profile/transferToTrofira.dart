import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:trofira/core/utils/extensions.dart';

class TransferToTrofira extends StatelessWidget {
  const TransferToTrofira({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            "Transfer To Trofira Account",
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
                  height: 4.0.hp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/images/profile/human.png",
                            fit: BoxFit.contain, scale: 4.0),
                        SizedBox(
                          height: 4.0.hp,
                        ),
                        Text(
                          "Mary Sam",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "ProximaNova"),
                        ),
                        SizedBox(
                          height: 1.0.hp,
                        ),
                        Text(
                          "+234904567843",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black38,
                              fontFamily: "ProximaNova"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0.hp),
                      child: Icon(Icons.arrow_forward),
                    ),
                    Column(
                      children: [
                        Image.asset("assets/images/profile/human.png",
                            fit: BoxFit.contain, scale: 4.0),
                        SizedBox(
                          height: 4.0.hp,
                        ),
                        Text(
                          "Sheddy Sam",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "ProximaNova"),
                        ),
                        SizedBox(
                          height: 1.0.hp,
                        ),
                        Text(
                          "+234904567843",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black38,
                              fontFamily: "ProximaNova"),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 4.0.hp,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 2.0.hp),
                  height: 50,
                  width: 90.0.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                  margin: EdgeInsets.only(bottom: 2.0.hp),
                  height: 50,
                  width: 90.0.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        iconColor: Color(0xffDC143C),
                        border: InputBorder.none,
                        hintText: "Message(Optional)",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Save as beneficiary",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "ProximaNova"),
                    ),
                    ToggleSwitch(
                      minWidth: 6.0.wp,
                      minHeight: 3.0.hp,
                      cornerRadius: 30.0,
                      activeBgColors: [
                        [Color(0xffDC143C)],
                        [Colors.black12]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.black12,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      radiusStyle: true,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Get.to(()=>DepositWithCard());
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
}
