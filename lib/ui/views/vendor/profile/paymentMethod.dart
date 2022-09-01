import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/vendor/profile/depositPage.dart';

class Paymentmethod extends StatefulWidget {
  const Paymentmethod({ Key? key }) : super(key: key);

  @override
  State<Paymentmethod> createState() => _PaymentmethodState();
}

class _PaymentmethodState extends State<Paymentmethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:true,
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back,color: Colors.black,),
      ),
      elevation: 0,
      backgroundColor:Colors.white,
      title: Text("Payment Method", style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w600,fontFamily:"ProximaNova"),),
      
      ),
      body:Container(
        height: 100.0.hp,
        width: 100.0.wp,
        child: ListView(
          children: [
             SizedBox(height: 3.0.hp,),
            Padding(
              padding:  EdgeInsets.only(left: 5.0.wp),
              child: Align( alignment: Alignment.centerLeft,child: Text("Choose a mode of payment")),
            ),
            SizedBox(height: 4.0.hp,),
            Container(
               margin: EdgeInsets.only(left: 5.0.wp, right:5.0.wp),
              height: 50,
              width: 90.0.wp,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                 BoxShadow(
                   color: Colors.grey,
                   spreadRadius: -4,
                   blurRadius: 6,
                 )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Padding(
                  padding:  EdgeInsets.only(left: 4.0.wp),
                  child: Row(children: [
                    Image.asset("assets/images/profile/card.png", scale: 3.0,),
                    SizedBox(width: 4.0.wp,),
                    Text("Card", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "ProximaNova"),),
                  ],),
                ),
                Radio(value: 1, groupValue: 1, onChanged: buttonFunction(), activeColor: Color(0xffDC143C),fillColor:MaterialStateProperty.all<Color>(Color(0xffDC143C)) ,),
              ],),

            ),

            
          GestureDetector(
            onTap: (){
              Get.to(()=>DepositPage());
            },
            child: Container(
              margin: EdgeInsets.only(top: 50.0.hp, left: 5.0.wp, right:5.0.wp),
              
              height: 8.0.hp,
              width: 90.0.wp,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                color: Color(0xffDC143C),
              ),
              child: Center(child: Text("Proceed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
            ),
          ),
          ],
        ),
      )
           
      
      );
      
    
  }
}

buttonFunction(){

}