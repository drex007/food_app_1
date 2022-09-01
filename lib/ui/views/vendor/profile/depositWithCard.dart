import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trofira/core/utils/extensions.dart';

class DepositWithCard extends StatefulWidget {
  String? amount;
  DepositWithCard({ Key? key , required this.amount }) : super(key: key);

  @override
  State<DepositWithCard> createState() => _DepositWithCardState();
}

class _DepositWithCardState extends State<DepositWithCard> {

 TextEditingController accountHolderController = TextEditingController();
 TextEditingController cardNumberController = TextEditingController();
 TextEditingController expiryDateController = TextEditingController();
 TextEditingController cvvController = TextEditingController();

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
      title: Text("Deposit With Card", style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w600,fontFamily:"ProximaNova"),),
      
      ),
      body: 
       Container(
        height: 100.0.hp,
        width: 100.0.wp,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
          child: ListView(
            children: [
              SizedBox(height: 3.5.hp,),
              Center(child: Text("₦" + " " + widget.amount! ,style: TextStyle(fontFamily: "ProximaNova", fontWeight: FontWeight.w600, fontSize: 30.0.sp)),
              
              ),
              Center(child:Text("Deposit Amount ", style: TextStyle(fontFamily: "ProximaNova", fontWeight: FontWeight.w300, fontSize: 15.0.sp),)),
              SizedBox(height: 4.0.hp,),
              Container(
                margin: EdgeInsets.only(bottom: 2.0.hp),
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
                child: Padding(
                  padding:  EdgeInsets.only(left: 5.0.wp),
                  child: TextField(
                    controller: accountHolderController,
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                      iconColor:Color(0xffDC143C) ,
                    border: InputBorder.none,
                    hintText:"Enter Amount to deposit" ,

                    ),
                  ),
                ),

              ),
              Container(
                margin: EdgeInsets.only(bottom: 2.0.hp),
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
                child: Padding(
                  padding:  EdgeInsets.only(left: 5.0.wp),
                  child: TextField(
                    controller: cardNumberController,
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                      iconColor:Color(0xffDC143C) ,
                    border: InputBorder.none,
                    hintText:"Enter Card Number" ,

                    ),
                  ),
                ),

              ),
            Row(
              children: [
              Container(
                height: 50,
                width: 43.0.wp,
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
             child: Padding(
               padding: EdgeInsets.only(left: 5.0.wp),
               child: TextField(
                 controller: expiryDateController,
                 keyboardType:TextInputType.number,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: "Expiry Date",
                 ),
               ),
             ),
                ),
                SizedBox(width: 3.5.wp),
                  Container(
                height: 50,
                width: 43.0.wp,
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
             child: Padding(
               padding: EdgeInsets.only(left: 5.0.wp),
               child: TextField(
                 controller: cvvController,
                 keyboardType:TextInputType.number,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: "CVV",
                 ),
               ),
             ),
                ),
           
              ],
            ),

              
            GestureDetector(
              onTap: (){
              
              },
              child: Container(
                margin: EdgeInsets.only(top: 9.0.hp),
                height: 8.0.hp,
                width: 90.0.wp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Color(0xffDC143C),
                ),
                child: Center(child: Text("Deposit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
              ),
            ),

            Container(

              margin: EdgeInsets.only(top:70.0.hp, left: 25.0.wp),
              padding:EdgeInsets.only(bottom: 10.0.hp) ,
              child: Center(
                child: Row(children: [
                  Image.asset("assets/images/profile/sec.png", scale: 4.0,),
                  SizedBox(width:2.0.wp),
                  Text("Secured by"),
                  SizedBox(width:1.0.wp),
                  Text("Trofira", style: TextStyle(fontWeight: FontWeight.w600)),
                ],),
              ),
            )
            ],
          ),
        ),
      )
           
      
     
    );
  }
}