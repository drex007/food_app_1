import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/vendor/profile/depositWithCard.dart';


class DepositPage extends StatelessWidget {
  const DepositPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController depositController = TextEditingController();

    return 
    Scaffold(
      appBar: AppBar(centerTitle:true,
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back,color: Colors.black,),
      ),
      elevation: 0,
      backgroundColor:Colors.white,
      title: Text("Deposit", style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w600,fontFamily:"ProximaNova"),),
      
      ),
      body:Container(
        height: 100.0.hp,
        width: 100.0.wp,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
          child: ListView(
            children: [
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
                child: Padding(
                  padding:  EdgeInsets.only(left: 5.0.wp),
                  child: TextField(
                    controller: depositController,
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                      iconColor:Color(0xffDC143C) ,
                    border: InputBorder.none,
                    hintText:"Enter Amount to deposit" ,
                   

                    ),
                  ),
                ),

              ),

              
            GestureDetector(
              onTap: (){
               if (depositController.text.isNotEmpty){
                 Get.to(()=>DepositWithCard(amount: depositController.text));
               } else {
                DepositPage();
               }
                
              },
              child: Container(
                margin: EdgeInsets.only(top: 5.0.hp),
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
        ),
      )
           
      
      );
    
  }
}