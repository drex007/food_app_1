import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';

import 'mainPage.dart';
class History extends StatelessWidget {
  const History({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imagePath ="assets/images/profile/";
    var listofRes = {
      "FoodZilla":"first.png",
      "Goodness & Richman":"second.png",
      "Nala & Nero Foods":"third.png",
      "Wengs Eatery":"fourth.png"

    };
     var locationTime = {
      "9.00 AM March 1, 2022":"No 22 Rayfield Jos",
      "8.00 PM March 1, 2022":"No 15 Bukuru Jos",
      "12.00 PM March 19, 2022":" No 122 Wengs Street, Tundun Wada",
      "5:30 PM April 3, 2022":"No 12 Citrus Estate Building"

    };
    return Scaffold(
      appBar: AppBar(centerTitle:true,
       
      leading:GestureDetector(
        onTap: (){
          Get.to(()=>DriversMainPage());
        },
        child: Icon(Icons.arrow_back,color: Colors.black,)
        ),
      elevation: 0,
      backgroundColor:Colors.white,
      title: Text("History", style: TextStyle(color:Colors.black,fontSize: 14, fontWeight: FontWeight.w600,fontFamily:"ProximaNova"),),
 
      
      ),
      
      body: ListView(
        children: [
          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.only(left:5.0.wp),
            child: Text("Yesterday", style: TextStyle(fontWeight:FontWeight.w600, fontSize: 12.0.sp )),
          ),

          SizedBox(height: 10,),


          ListView.builder(
            shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (_, index){
          return Container(
            margin: EdgeInsets.only(left: 3.0.wp, right: 3.0.wp, top: 2.0.hp),
            width: 80.0.wp,
            height: 20.0.hp,
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
                  margin: EdgeInsets.only(left: 10, top:20, bottom:20,),
                  height: 16.0.hp,
                  width: 23.0.wp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
          
                  ),
                child:Image.asset(imagePath + listofRes.values.elementAt(index), fit: BoxFit.cover),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    //Restruant Name 
                    Text(listofRes.keys.elementAt(index), style: TextStyle(fontWeight:FontWeight.w600, fontSize: 12.0.sp ),),
                    SizedBox(height: 5),
                    Text("Delivered", style: TextStyle(fontWeight:FontWeight.w200, fontSize: 10.0.sp ),),
                    SizedBox(height: 5),
                    //Time and date
                    Row(children:[
                      Image.asset(imagePath + "Calendar.png", scale: 4.0),
                      SizedBox(width:5,),
                      Text(locationTime.keys.elementAt(index))
                    ]),
                    //Location
                    SizedBox(height: 10),
                    Row(children:[
                      Image.asset(imagePath + "Location.png", scale:4.0),
                      SizedBox(width: 10,),
                      Container(
                        width: 50.0.wp,
                        margin: EdgeInsets.only(right: 5.0.wp),
                        child: Text(locationTime.values.elementAt(index), maxLines: 2,softWrap: true,))
                    ]),
                    
                    
                  ],
                ),
              ],
            ),
          );
    }),
        ],
      )
    );
  }
}