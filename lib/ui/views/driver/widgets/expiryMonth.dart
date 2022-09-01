import 'package:flutter/material.dart';

class ExpiryMonth extends StatefulWidget {
  ExpiryMonth({Key? key}) : super(key: key);

  @override
  State<ExpiryMonth> createState() => _ExpiryMonthState();
}

class _ExpiryMonthState extends State<ExpiryMonth> {
  
  
  List Months = [01,02,03,04,05,06,
  07,08,09,10,11,12];
  var currrent_month ;
  @override
  Widget build(BuildContext context) {
    
    return DropdownButton(
      hint: Text("Expiry Month"),
      alignment: AlignmentDirectional.center,
      isExpanded: true,
      value: currrent_month,
      underline: SizedBox(),
      items: Months.map((expMonth) {
        return DropdownMenuItem(
          
          value:expMonth,
          child: Text(expMonth.toString()),
        );

      }).toList(), onChanged:(newValue){
        setState(() {
          currrent_month = newValue as int ;
        });

      });
  }
}