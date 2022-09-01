import 'package:flutter/material.dart';

class ExpiryDay extends StatefulWidget {
  ExpiryDay({Key? key}) : super(key: key);

  @override
  State<ExpiryDay> createState() => _ExpiryDayState();
}

class _ExpiryDayState extends State<ExpiryDay> {
  
  
  List Months = [01,02,03,04,05,06,
  07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,
  23,24,25,26,27,28,29,30,31];
  var currrent_Day ;
  @override
  Widget build(BuildContext context) {
    
    return DropdownButton(
      hint: Text("Expiry Day"),
      isExpanded: true,
      value: currrent_Day,
      underline: SizedBox(),
      items: Months.map((expDay) {
        return DropdownMenuItem(
          
          value:expDay,
          child: Text(expDay.toString()),
        );

      }).toList(), onChanged:(newValue){
        setState(() {
          currrent_Day = newValue as int ;
        });

      });
  }
}