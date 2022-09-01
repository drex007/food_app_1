import 'package:flutter/material.dart';
import 'package:trofira/core/utils/extensions.dart';


class CustomButton extends StatelessWidget {
  final String buttonText;
  CustomButton({ Key? key , required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:90.0.wp,
      height: 8.0.hp,
      decoration: BoxDecoration(
        color: Color(0xffDC143C),
        borderRadius: BorderRadius.circular(10),
      ),
      
      
      child: Center(
        child: Text(buttonText , style: TextStyle(
          color: Colors.white,
          fontSize: 18.0.sp,
          fontFamily: "ProximaNova",
        )),
      ),
      
    );
  }
}