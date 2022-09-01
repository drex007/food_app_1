import 'package:flutter/material.dart';
import 'package:trofira/core/utils/extensions.dart';

class CustomSmallButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  CustomSmallButton({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.borderColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0.wp,
      height: 45,
      decoration: BoxDecoration(
        color: buttonColor,
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 13.0.sp,
              fontFamily: "ProximaNova",
            )),
      ),
    );
  }
}
