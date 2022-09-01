// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../core/constants/assets_paths.dart';

// import 'components/find_driver_dialog.dart';
// import 'components/order_details_components.dart';



// class OrderInfo extends StatefulWidget {
//   const OrderInfo({Key? key,
  
  
//   }) : super(key: key);

//   @override
//   _OrderInfoState createState() => _OrderInfoState();
// }


// class _OrderInfoState extends State<OrderInfo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Color(0xff363636)),
//           onPressed: () => Get.back(),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           "Today's Order",
//           style: TextStyle(
//               color: Color(0xff363636),
//               fontFamily: 'ProximaNova',
//               fontWeight: FontWeight.w600,
//               fontSize: 18),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//              Image.asset(AssetPaths.todayOrder),
//               const SizedBox(height: 10),
//               const DetailComponents(),
//               SizedBox(
//                 height: 48,
//                 width: 366,
//                 child: TextButton(
//                     onPressed: () {
//                       showDialog(context: context, builder: (BuildContext) => FindDriverDialog());
//                     },
//                     style: ButtonStyle(
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadiusDirectional.circular(15),
//                           )),
//                       backgroundColor:
//                       MaterialStateProperty.all(const Color(0xffDC143C)),
//                     ),
//                     child: const Text(
//                       "Find Driver",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'ProximaNova',
//                         fontSize: 18,
//                       ),
//                     )),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
