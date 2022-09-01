import 'package:flutter/material.dart';

import '../../../vendor/profile/accountPage.dart';
import '../../dashboard.dart';
import '../../order_history.dart';
import '../../orders.dart';

class DashboardPageController extends StatefulWidget {
  const DashboardPageController({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardPageController> createState() =>
      _DashboardPageControllerState();
}

class _DashboardPageControllerState extends State<DashboardPageController> {
  int _selectedIndex = 0;
  var pages = [DashBoard(), Orders(), OrderHistory(), AccountPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            _selectedIndex = index;
            setState(() {});
          },
          elevation: 0,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xffDC143C),
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(color: Color(0xffDC143C)),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Image.asset(
                  "assets/images/profile/home.png",
                  scale: 4.0,
                )),
            BottomNavigationBarItem(
                label: "Orders",
                icon: Image.asset(
                  "assets/images/icons/orders.png",
                )),
            BottomNavigationBarItem(
                label: "History",
                icon: Image.asset(
                  "assets/images/profile/history.png",
                  scale: 4.0,
                )),
            BottomNavigationBarItem(
                label: "Account",
                icon: Image.asset(
                  "assets/images/profile/myprofile.png",
                  scale: 4.0,
                )),
          ]),
    );
  }
}
