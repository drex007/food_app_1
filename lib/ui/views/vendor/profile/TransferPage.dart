import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/vendor/profile/transferToBankAccount.dart';
import 'package:trofira/ui/views/vendor/profile/transferToTrofiraAccount.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({ Key? key }) : super(key: key);

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
      title: Text("Transfer", style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w600,fontFamily:"ProximaNova"),),
      
      ),
      body:Container(
        height: 100.0.hp,
        width: 100.0.wp,
        child: Column(
          children: [
             SizedBox(height: 3.0.hp,),
            Padding(
              padding:  EdgeInsets.only(left: 5.0.wp),
              child: Align( alignment: Alignment.centerLeft,child: Text("Choose a mode of Transfer")),
            ),
            SizedBox(height: 4.0.hp,),
            Container(
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
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>TransferToBankAccount());
                    },
                    child: Row(children: [
                      Image.asset("assets/images/profile/tobank.png", scale: 4.0,),
                      SizedBox(width: 4.0.wp,),
                      Text("To Bank Account", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "ProximaNova"),),
                    ],),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:8.0),
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>TransferToBankAccount());
                    },
                    child: Icon(Icons.arrow_forward_ios, color: Color(0xffDC143C))),
                ),
             
              ],),

            ),
            SizedBox(height: 10),
           Container(
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
                  child: GestureDetector(
                    onTap: (){
                       Get.to(()=>TransferToTrofiraAccount());
                    },
                    child: Row(children: [
                      Image.asset("assets/images/profile/trof.png", scale: 4.0,),
                      SizedBox(width: 4.0.wp,),
                      Text("To Trofira Account", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "ProximaNova"),),
                    ],),
                  ),
                ),
                GestureDetector(
                   onTap: (){
                     Get.to(()=>TransferToTrofiraAccount());

                   },
                  child: Padding(
                    padding:  EdgeInsets.only(right:8.0),
                    child: Icon(Icons.arrow_forward_ios, color: Color(0xffDC143C)),
                  )),
             
              ],),

            ),
          
          ],
        ),
      )
           
      
      );
     
  }
}