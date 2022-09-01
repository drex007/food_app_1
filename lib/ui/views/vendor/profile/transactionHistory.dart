import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({ Key? key }) : super(key: key);

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
      title: Text("Transaction History", style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w600,fontFamily:"ProximaNova"),),
      
      ),
      body: ListView(
        children: [
          TransactionDetails(Heading: "Yesterday",Name:"Femi Bolaji",Amount: "₦ 5000", Date: "12/03/22", Time: " - 11:55 AM", TransactionType: "Transfer"),
           TransactionDetails(Heading: "10th March",Name:"JohnPaul Nwobodo",Amount: "₦ 5000", Date: "5/03/22", Time: " - 12:05 AM", TransactionType: "Withdrawal"),
            TransactionDetails(Heading: "5th March",Name:"Goodness Richard",Amount: "₦ 5000", Date: "12/03/22", Time: " - 11:55 AM", TransactionType: "Transfer")
        ],
      )
          
      );
      
    
  
  }
}

class TransactionDetails extends StatelessWidget {
  final String Heading;
  final String Name;
  final String Amount;
  final String Date;
  final String Time;
  final String TransactionType;

 TransactionDetails({Key? key, required this.Heading, required this.Name, required this.Amount, required this.Date, required this.Time, required this.TransactionType }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 100.0.wp,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.grey,
          spreadRadius: -4,
          blurRadius: 6,
        )]
      ),
      
      child:    Column(children: [
        SizedBox(height: 10,),
        Container( alignment: Alignment.centerLeft, padding: EdgeInsets.only(left: 10),child: Text(this.Heading, style: TextStyle(fontWeight: FontWeight.w600),)),
        Container(
          child: Column(children: [
         
         Padding(
               padding:  EdgeInsets.only(left: 10, right: 10, top: 15),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:[
                  Text(this.Name, style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w400,fontFamily:"ProximaNova" ),) ,
                   Text(this.Amount,style: TextStyle(color: Color(0xffDC143C)),),
                 ]
               ),
             ),

         Padding(
               padding: EdgeInsets.only( left:10, right: 10, top: 5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 Row(children: [
                   Text(this.Date, style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w200, color: Colors.grey),),
                  
                   Text(this.Time, style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w200, color: Colors.grey),),],
                 ),
                 Text(this.TransactionType, style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w200, color: Colors.grey),)
            

               ],),
             ),
         Container(
             margin: EdgeInsets.only(left: 3.2.wp, right: 3.2.wp, top: 2.0.hp),
            
             height:1,
             width:95.0.wp,
             color: Colors.black12,
           ),
             
        ]),
        ),
         Container(
          child: Column(children: [
         
         Padding(
               padding:  EdgeInsets.only(left: 10, right: 10, top: 15),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:[
                  Text(this.Name, style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w400,fontFamily:"ProximaNova" ),) ,
                   Text(this.Amount,style: TextStyle(color: Color(0xffDC143C)),),
                 ]
               ),
             ),

         Padding(
               padding: EdgeInsets.only( left:10, right: 10, top: 5, bottom: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 Row(children: [
                   Text(this.Date, style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w200, color: Colors.grey),),
                  
                   Text(this.Time, style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w200, color: Colors.grey),),],
                 ),
                 Text(this.TransactionType, style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w200, color: Colors.grey),)
            

               ],),
             ),
         Container(
             margin: EdgeInsets.only(left: 3.2.wp, right: 3.2.wp, top: 2.0.hp),
            
             height:1,
             width:95.0.wp,
             color: Colors.black12,
           ),
             
        ]),
        ),
      
         

      ]
      )
    
    );
  }
}