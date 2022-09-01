import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';
import '../logistics_company.dart';
import '../my_drivers.dart';
import '../random_driver.dart';
import '../textWidgets/mediumText.dart';

class CommentBox extends StatefulWidget {
  const CommentBox({Key? key}) : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Container(
        height: 180,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Reason for declining ",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontFamily: 'ProximaNova',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                )),
            SizedBox(height: 5),
            Container(
                height: 50,
                decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Color(0xffDC143C),
                    // ),
                    // borderRadius: BorderRadius.circular(10),
                    ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        // border: InputBorder.none,
                        ),
                  ),
                )),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffDC143C)),
                    ),
                    child: Center(
                        child: MediumText(
                            text: "Decline", color: Color(0xffDC143C))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
