import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/vendor/profile/transferToTrofira.dart';

class TransferToTrofiraAccount extends StatelessWidget {
  const TransferToTrofiraAccount({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      title: Text("Transfer To Trofira Account", style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w600,fontFamily:"ProximaNova"),),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right:8.0),
          child: Icon(Icons.search, color: Colors.black),
        ),
      ],
      ),
      body:Container(
        color: Colors.white,
        width: 100.0.wp,
        padding: EdgeInsets.only(left: 7.0.wp, right :7.0.wp),
        child: ListView(
          children: [
            SizedBox(height: 15),
            Text("Make transfer To any Trofira Account", style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "ProximaNova"),),
            SizedBox(height: 25,),
            Text("Saved Beneficiaries", style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "ProximaNova"),),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Get.to(()=>TransferToTrofira());
              },
              child: Container( alignment: 
              Alignment.centerLeft,height: 50, 
              width: 10.0.wp, 
              child: Image.asset("assets/images/profile/human.png",fit: BoxFit.contain, scale: 2.0,)
              )
              ),
            SizedBox(height: 10,),
            Text("Choose Beneficiary", style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "ProximaNova"),),
            SizedBox(height: 20),
            
             Container(
                height:1,
                width:100.0.wp,
                color: Colors.black12,
            ),
            SizedBox(height: 20),
            Text("A"),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:10,
              itemBuilder: (_,index){
                return Container(
                
                  height:10.0.hp, width: 90.0.wp,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>TransferToTrofira());
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(50) ,
                            color: index.isEven ?Color.fromARGB(255, 190, 228, 147): Color.fromARGB(255, 238, 137, 229),
                          ),
                          child: Center(child: Text("A",style: TextStyle(color:index.isEven ?Color.fromARGB(255, 4, 226, 11): Color.fromARGB(255, 206, 16, 3),fontWeight: FontWeight.w500,fontSize: 15.0.sp),)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0.wp),
                          child: Column(
                  
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Container(child:index.isOdd? Text("Abba",style: TextStyle(fontWeight: FontWeight.w600),):Text("Abubakar",style: TextStyle(fontWeight: FontWeight.w600),)),
                              SizedBox(height: 8,),
                              Text("09094754452")
                            ],
                          ),
                        ),
                     
                         ],
                    ),
                  ),
                );
            })


          ],
        ),
      )

      
);
    
    }
  
   }