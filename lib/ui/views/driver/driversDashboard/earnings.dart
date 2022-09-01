import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'driversDashboard.dart';
import 'mainPage.dart';
class Earnings extends StatelessWidget {
  const Earnings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(centerTitle:true,
       
      leading:GestureDetector(
        
        onTap: (){
          // Get.to(()=>DriversDashboard());
        },
        child: Icon(Icons.arrow_back,color: Colors.black,)),
      elevation: 0,
      backgroundColor:Colors.white,
      title: Text("Earnings", style: TextStyle(color:Colors.black,fontSize: 14, fontWeight: FontWeight.w600,fontFamily:"ProximaNova"),),
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.only(right:10.0),
      //     child: InkWell(
      //       child: Icon(Icons.search, color: Colors.black,),
      //     ),
      //   )
      // ],
      
      ),
      
      
      body:ListView(
        children: [
          Container(
            height: 100,
            width:100.0.wp,
            child: Column(
              children: [
                SizedBox(height: 15),
                Text("₦ 50,000",style: TextStyle(fontWeight:FontWeight.w600, fontSize: 22.0.sp )),
                Text("Current Balance",style: TextStyle(color:Colors.black26,fontWeight:FontWeight.w200, fontSize: 12.0.sp )),
              ],
            ),  
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.wp, right:8.0.wp),
            child: Row(children: [
               // Delivery Container
              Container(height: 10.0.hp,
              width: 40.0.wp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border:Border.all(color: Color(0xffDC143C)) ,
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("Total Delivery", style: TextStyle(color: Color(0xffDC143C)),),
                  SizedBox(height: 10,),
                  Text("36", style: TextStyle(color: Color(0xffDC143C)),)
                ],
              ),
              ),
                SizedBox(width: 10),
                // Earned Container
                Container(height: 10.0.hp,
              width: 40.0.wp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffDC143C),
               
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("Earned", style: TextStyle(color: Colors.white),),
                  SizedBox(height: 10,),
                  Text("₦ 105,000", style: TextStyle(color:Colors.white),)
                ],
              ),
              ), 
 
            ],),
          ),
          SizedBox(height: 10,),
          EarningHistory(),
        ],
      ),
    );
  }
}

class EarningHistory extends StatelessWidget {
  const EarningHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
     
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (_, index){
      return Container(
        margin: EdgeInsets.only(left: 3.0.wp, right: 4.0.wp, top: 1.0.hp),
        width: 80.0.wp,
        height: 12.0.hp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), 
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: -4,
            )
          ]
        ),
        child: Row(
         
          children: [
            Container(
              margin: EdgeInsets.only(left: 30, top:10, bottom:10,),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black12,
      
              ),
            child:index.isEven ? Image.asset("assets/images/profile/richmanOti.png", fit: BoxFit.cover,):Image.asset("assets/images/profile/missOti.png", fit: BoxFit.cover),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
               
                Text("Richman oti", style: TextStyle(fontWeight:FontWeight.w600, fontSize: 12.0.sp ),),
                SizedBox(height: 10),
                //ID
                Text("R340473646"),

              ],
            ),
            SizedBox(width:25.0.wp),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
               
                Text("₦ 50,000", style: TextStyle(fontWeight:FontWeight.w600, fontSize: 12.0.sp ),),
   
              ],
            ),
 
          ],
        ),
      );
    });
  }
}