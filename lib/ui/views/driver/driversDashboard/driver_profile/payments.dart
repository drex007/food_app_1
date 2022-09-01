import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'withdraw.dart';


class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);


  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
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
          "Payments",
          style: TextStyle(
              color: Color(0xff363636),
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 118,
              width: 366,
              padding: EdgeInsets.all(10),
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

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Current Balance",
                          style: TextStyle(
                              color: Color(0xff363636),
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: (){
                            // action
                          },
                          child: Text(
                            "Add Card",
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Today April 1, 2022",
                      style: TextStyle(
                          color: Color(0xff363636),
                          fontFamily: 'ProximaNova',
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    Spacer(),
                    Center(
                      child:  Text(
                        "65,500",
                        style: TextStyle(
                            color: Color(0xff363636),
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.w600,
                            fontSize: 24),
                      ),
                    )

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 48,
              width: 366,
              child: TextButton(
                  onPressed: () {
                    Get.to(()=>Withdrawal());
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(15),
                        )),
                    backgroundColor:
                    MaterialStateProperty.all(const Color(0xffDC143C)),
                  ),
                  child: const Text(
                    "Request Widrawal",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ProximaNova',
                      fontSize: 18,
                    ),
                  )),
            ),
          ],
        ),
      ),

    );
  }
}
