import 'package:flutter/material.dart';
import 'package:trofira/core/utils/extensions.dart';

class ListOfPickUps extends StatelessWidget {
  final String imagePath;
  final String restruantName;
  final String location;
  final String datetime;
 ListOfPickUps({Key? key, required this.imagePath, required this.restruantName, required  this.location,required  this.datetime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listofRes = {
      "FoodZilla":"first.png",
      "Goodness & Richman":"second.png",
      "Nala & Nero Foods":"third.png",
      "Wengs Eatery":"fourth.png"

    };

    return ListView.builder(
     
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
            child:Image.asset(this.imagePath + listofRes.values.elementAt(index), fit: BoxFit.cover),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                //Restruant Name 
                Text(listofRes.keys.elementAt(index), style: TextStyle(fontWeight:FontWeight.w600, fontSize: 12.0.sp ),),
                SizedBox(height: 5),
                //Time and date
                Row(children:[
                  Image.asset(this.imagePath + "Calendar.png", scale: 4.0),
                  SizedBox(width:5,),
                  Text(this.datetime)
                ]),
                //Location
                SizedBox(height: 10),
                Row(children:[
                  Image.asset(this.imagePath + "Location.png", scale:4.0),
                  SizedBox(width: 10,),
                  Container(
                    width: 50.0.wp,
                    margin: EdgeInsets.only(right: 5.0.wp),
                    child: Text(this.location, maxLines: 2,softWrap: true,))
                ]),
                
                
              ],
            ),
          ],
        ),
      );
    });
  }
}


