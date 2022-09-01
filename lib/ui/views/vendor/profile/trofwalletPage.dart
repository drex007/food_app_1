import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/vendor/profile/TransferPage.dart';
import 'package:trofira/ui/views/vendor/profile/paymentMethod.dart';
import 'package:trofira/ui/views/vendor/profile/withdrawalPage.dart';

class TrofWallet extends StatefulWidget {
  const TrofWallet({ Key? key }) : super(key: key);

  @override
  State<TrofWallet> createState() => _TrofWalletState();
}

class _TrofWalletState extends State<TrofWallet> {
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
      title: Text("TroffWallet", style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w600,fontFamily:"ProximaNova"),),
      
      ),
      body: ListView(

        children:[
          //Image Container 
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //   // ElevatedButton(onPressed: (){Get.to(()=>Paymentmethod());}, child: Text("Top up"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xffDC143C))),),
          //   // ElevatedButton(onPressed: (){Get.to(()=>TransferPage());}, child: Text("TransFer"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xffDC143C))),),
          //   // ElevatedButton(onPressed: (){Get.to(()=>WithdrawalPage());}, child: Text("Withdraw"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xffDC143C))),),
          //   ElevatedButton(onPressed: (){Get.to(()=>TransactionHistory());}, child: Text("History"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xffDC143C))),),
            
          // ],),

          Container(
            margin: EdgeInsets.only(left: 3.0.wp, right: 3.0.wp),
            height: 30.0.hp,
            width: 90.0.wp,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(10) ,
              color:Color(0xffDC143C),
              // image: DecorationImage(image:  AssetImage("assets/images/profile/balance.png")),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.0.hp),
                Padding(
                  padding: EdgeInsets.only(left: 8.0.wp),
                  child: Text("Current Balance", style: TextStyle(color: Colors.white,fontWeight:FontWeight.w400,fontFamily:"ProximaNova"),),
                ),
                SizedBox(height:20),
                Padding(
                  padding: EdgeInsets.only(left: 8.0.wp),
                  child: Text("₦ 45,000",style: TextStyle(color: Colors.white,fontSize:20.0.sp, fontWeight:FontWeight.w600,fontFamily:"ProximaNova")),
                ),
                SizedBox(height:20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>Paymentmethod());
                        },
                        child: Column(
                          children: [
                            Image.asset("assets/images/profile/topup.png",fit: BoxFit.cover, scale: 3.0,),
                            SizedBox(height:15),
                            Text("Topup",style: TextStyle(color: Colors.white, fontWeight:FontWeight.w400,fontFamily:"ProximaNova")),
                          ],
                        ),
                      ),
                       GestureDetector(
                         onTap:(){
                           Get.to(()=>TransferPage());
                         },
                         child: Column(
                          children: [
                            Image.asset("assets/images/profile/transferIcon.png",fit: BoxFit.cover, scale: 3.0,),
                            SizedBox(height:15),
                            Text("Transfer",style: TextStyle(color: Colors.white, fontWeight:FontWeight.w400,fontFamily:"ProximaNova")),
                          ],
                                             ),
                       ), 
                       GestureDetector(
                         onTap: (){
                           Get.to(()=>WithdrawalPage());
                         },
                         child: Column(
                          children: [
                            Image.asset("assets/images/profile/withdrawIcon.png",fit: BoxFit.cover, scale: 3.0,),
                            SizedBox(height:15),
                            Text("Withdraw",style: TextStyle(color: Colors.white, fontWeight:FontWeight.w400,fontFamily:"ProximaNova")),
                          ],
                                             ),
                       ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:10),
          Padding(
            padding: EdgeInsets.only(left: 3.2.wp, right:3.2.wp, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
              Text("Transactions", style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w600,fontFamily:"ProximaNova" ),), 
              Text("See all",style:TextStyle(color: Color(0xffDC143C)))
              ],
              ),
          ),
          //Line Container
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.2.wp),
            height:1,
            width:90.0.wp,
            color: Colors.black12,
          ),
          SizedBox(height: 20,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              
             
              itemCount: 7,
              itemBuilder: (_, index){
              return Container(
                margin: EdgeInsets.only( left: 3.0.wp,right: 3.0.wp),
                height: 13.0.hp,
                width: 90.0.wp,
                decoration: BoxDecoration(
                  color: Colors.white, 
                ),
                child: Column(children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        if(index < 4) Text("Femi Bolaji", style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w400,fontFamily:"ProximaNova" ),) else Text("Goodness Ezekafor", style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w400,fontFamily:"ProximaNova" ),) ,
                        Text("₦ 5,000",style: TextStyle(color: Color(0xffDC143C)),),
                      ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only( left:10, right: 10, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Row(children: [
                        Text("12/03/2022", style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w200, color: Colors.grey),),
                        SizedBox(width: 4,),
                        Text("- 11:25 AM", style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w200, color: Colors.grey),),
                      ],),
                      if (index < 4) Text("Transfer", style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w200, color: Colors.grey),) else  Text("Withdrawal", style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w200, color: Colors.grey),),

                    ],),
                  ),
                  SizedBox( height: .0.hp,),
             Container(
            margin: EdgeInsets.symmetric(horizontal: 3.2.wp),
            height:1,
            width:90.0.wp,
            color: Colors.black12,
          ),
                  

                ]),
              );
            })
        ]
      ),
      
    );
  }
}