import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/utils/extensions.dart';
import '../../../../core/constants/assets_paths.dart';



class RandomDriver extends StatelessWidget {
   RandomDriver({Key? key}) : super(key: key);
    var drivers = [
    {"name": "Brian David",
    "email": "Briandave@gmail.com",
    "image": ""  },
     {"name": "Sam Samuel",
    "email": "sammysam@gmail.com",
    "image": ""  },
     {"name": "Yossi Yon",
    "email": "yossiyon@gmail.com",
    "image": ""  },
  ];
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff363636)),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Random Driver",
          style: TextStyle(
              color: Color(0xff363636),
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
      body: ListView(
        children: [
          for(var driver in drivers)
      Container(
        padding: EdgeInsets.only(left: 2.0.wp, right: 2.0.wp, top: 5, bottom:5 ),
        margin:  EdgeInsets.only(left: 2.0.wp, right: 2.0.wp, top: 5, bottom:5 ),
        width: 94.0.wp,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow:[
            BoxShadow(
              spreadRadius: -3,
              blurRadius: 4,
            )
          ] ,
        ),
        child: Row(
          children:[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black,
              ),
              child: Image.asset(
                AssetPaths.driverProfilePicture,
                ),

            ),
            Container(
              width: 150,
              height: 80,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:15),
                    Text(driver["name"].toString(), 
                    style: TextStyle(fontFamily: "ProximaNova",
                    fontSize: 12,
                    fontWeight:FontWeight.w600,
                    ),),
                    SizedBox(height:0),
                    Text(driver["email"].toString(),
                    style: TextStyle(fontFamily: "ProximaNova",
                    fontSize: 12,
                    fontWeight:FontWeight.w600,
                    )
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width:6.0.wp),
            RequestButton(),


          ]
        ),
      
      )
        ]
      ),
    );
  }
}

class RequestButton extends StatelessWidget {
  const RequestButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xffDC143C),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: const Text(
          "Request",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'ProximaNova',
              fontSize: 12,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
