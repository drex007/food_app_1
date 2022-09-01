import 'package:flutter/material.dart';
import 'package:trofira/ui/views/driver/driversDashboard/driversDashboard.dart';
import 'package:trofira/ui/views/driver/driversDashboard/earnings.dart';
import 'package:trofira/ui/views/driver/driversDashboard/history.dart';

import 'driver_profile/driver_account.dart';
import 'driversAccount.dart';

class DriversMainPage extends StatefulWidget {
  const DriversMainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DriversMainPage> createState() => _DriversMainPageState();
}

class _DriversMainPageState extends State<DriversMainPage> {
  int _selectedIndex = 0;
  var pages = [
    DriversDashboard(),
    Earnings(),
    History(),
    DriverAccount(),
  ];
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
                label: "Earnings",
                icon: Image.asset(
                  "assets/images/profile/earnings.png",
                  scale: 4.0,
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
