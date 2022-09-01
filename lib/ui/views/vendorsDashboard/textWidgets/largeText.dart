import 'package:flutter/material.dart';
import 'package:trofira/core/utils/extensions.dart';


class LargeText extends StatelessWidget {
  final String text;
  LargeText({ Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "ProximaNova",
        fontWeight: FontWeight.w600,
        fontSize: 12.0.sp,
        color: Colors.black,
      ),
      
    );
  }
}