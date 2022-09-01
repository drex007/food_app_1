import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'accountPage.dart';


class MyMenuPage extends StatefulWidget {
 
  MyMenuPage({Key? key}) : super(key: key);

  @override
  State<MyMenuPage> createState() => _MyMenuPageState();
}

class _MyMenuPageState extends State<MyMenuPage> {
   var myText = {
     "Pasta": "Spaghetti is made of milled wheat and water. It can be served as source or jollof",
     "Jollof Rice":"Jollof rice is a dish made with long grain rice, tomatoes, onions, spices, vegetables and meat." ,
     "Fried Rice" :"Fried rice is a dish of cooked that is stir-fried in a frying pan mixed with vegetables and meat.",
     "Smoothie": "These smoothie gives new life to your favorite  fruits and veggies - in a slurpable drink.",
     "Burger": "Burger is a sandwich consisting of one or more patties, steak, or beef placed in a bread roll."

   };
  //  List myTitle = [

  //  ];
   List myImages = [
     "pasta.png", "jollofRice.png", "fried_rice.png", "smoothie.png", "burger.png"

   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(onTap: (){
          Get.to(()=>AccountPage());
          setState(() {   
          });
        },child: Icon(Icons.arrow_back, color: Colors.black,)) ,
        backgroundColor: Colors.white,
        centerTitle: true,     
        elevation:0.0,  
        title: Text("My Menu", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontFamily: "ProximaNova")),
        actions: [
         
           Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(Icons.add, color: Color(0xffDC143C)),
          ),
         
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:20, left:15, bottom: 20, right:15),
        child: ListView.builder(
          itemCount: myImages.length,
          itemBuilder: (_, index) {
            return  Container(
              margin: EdgeInsets.only(bottom: 10),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    spreadRadius: -4,
                  ),

                ]
              ),
              height: 19.0.hp,
              width: 80.0.wp,
              child: Row(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal:2.0.wp),
                  child:Image.asset("assets/images/profile/"+myImages[index],fit: BoxFit.cover,),),
                Container(
                  width:60.0.wp,
                  padding: EdgeInsets.only(left: 0.0.wp ),
                
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Align(alignment: Alignment.centerLeft,child: Text(myText.keys.elementAt(index), style: TextStyle(fontWeight: FontWeight.w600),)),
                     SizedBox(height: 10),
                      Flexible(child: Text(myText.values.elementAt(index))),
                      SizedBox(height: 10),
                      Align(alignment: Alignment.centerLeft,child: Text("₦ 5,000", style: TextStyle(color:Color(0xffDC143C), fontWeight:FontWeight.w500),)),
                    ],
                  ),
                ),
              ],),
            );

          
          },
        
           
        ),
      ),
    );
  }
}