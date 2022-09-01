import 'package:flutter/material.dart';
import 'package:trofira/core/utils/extensions.dart';

import '../vendorsDashboard/components/order_details_list.dart' as orderList;

class OrdersTab extends StatefulWidget {
  OrdersTab({Key? key}) : super(key: key);

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        for (var order in orderList.orders)
          GestureDetector(
            onTap: () {},
            child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                width: 95.0.wp,
                height: 19.0.hp,
                child: Row(
                  children: [
                    Image.asset(order.image),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          order.name,
                          style: TextStyle(
                            color: Color(0xff363636),
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          order.dish,
                          style: TextStyle(
                            color: Color(0xff363636),
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          order.description,
                          style: TextStyle(
                            color: Color(0xff363636),
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\N ${order.price}",
                          style: const TextStyle(
                            color: Colors.red,
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffababab),
                      // Todo: Add opacity(18)
                      offset: Offset(1.0, 1.0),
                      blurRadius: 10.0,
                      spreadRadius: -5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                )),
          )
      ],
    );
  }
}
