import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Notifications extends StatelessWidget {
  const Notifications({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:true,
       
      leading:GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back)),
      elevation: 0,
      backgroundColor:Colors.white,
      title: Text("Notifications", style: TextStyle(color:Colors.black,fontSize: 14, fontWeight: FontWeight.w600,fontFamily:"ProximaNova"),),
      actions: [
        Padding(
          padding: EdgeInsets.only(right:10.0),
          child: InkWell(
            child: Icon(Icons.search, color: Colors.black,),
          ),
        )
      ],
      
      ),
      
      
      body: Text("Notify"),
    );
  }
}