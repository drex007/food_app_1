import 'package:flutter/material.dart';
import 'package:trofira/core/utils/extensions.dart';


class MediumText extends StatelessWidget {
  final String text;
  final Color  color;
  MediumText({ Key? key, required this.text, required this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "ProximaNova",
        fontWeight: FontWeight.w400,
        fontSize: 12.0.sp,
        color: color,
      ),
      
    );
  }
}