import 'package:flutter/material.dart';

class ExpiryYear extends StatefulWidget {
  ExpiryYear({Key? key}) : super(key: key);

  @override
  State<ExpiryYear> createState() => _ExpiryYearState();
}

class _ExpiryYearState extends State<ExpiryYear> {
  
  var currrent_year ;
  List Years = [2022,2023,2024,2025,2026,2027,2028,2029,2030,2031];
  
  @override
  Widget build(BuildContext context) {
    
    return DropdownButton(
      hint: Text("Expiry Year"),
      isExpanded: true,
      value: currrent_year,
      underline: SizedBox(),
      items: Years.map((expYear) {
        return DropdownMenuItem(
          
          value:expYear,
          child: Text(expYear.toString()),
        );

      }).toList(), onChanged:(newValue){
        setState(() {
          currrent_year= newValue as int ;
        });

      });
  }
}