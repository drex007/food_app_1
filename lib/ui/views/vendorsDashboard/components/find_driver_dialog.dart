import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';
import '../logistics_company.dart';
import '../my_drivers.dart';
import '../random_driver.dart';
import '../textWidgets/mediumText.dart';


class FindDriverDialog extends StatefulWidget {
  const FindDriverDialog({Key? key}) : super(key: key);

  @override
  _FindDriverDialogState createState() => _FindDriverDialogState();
}

class _FindDriverDialogState extends State<FindDriverDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))
      ),
      content: Container(
        height: 40.0.hp,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Driver",
              style: TextStyle(
                color: Color(0xff363636),
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w600,
                fontSize: 14,

            )),
            SizedBox(height: 20),

            Text(
                "Please select the driver you want to send a request to",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff363636),
                  fontFamily: 'ProximaNova',
                  fontWeight: FontWeight.w400,
                  fontSize: 11,

                )),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Get.to(()=> MyDriver());
              },
              child: MediumText(text: "My Driver", color:  Color(0xff363636))
            ),
            const SizedBox(height:25),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Get.to(()=> RandomDriver());
              },
              child: MediumText(text: "Randrom Drivers", color:  Color(0xff363636))
            ),
            const SizedBox(height:25),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Get.to(()=>LogisticsCompany());
              },
              child: MediumText(text: "Logistics", color:  Color(0xff363636))
            ),
          ],
        ),
      ),

    );
  }
}
