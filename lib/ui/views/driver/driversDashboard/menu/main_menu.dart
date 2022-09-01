import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trofira/core/constants/trofira_colors.dart';
import 'package:trofira/ui/views/widgets/custom_appBar_widget.dart';

import 'add_to_menu.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.menuWhite,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMaterialModalBottomSheet(
            bounce: true,
            context: context,
            builder: (context) => const AddItemToMenu(),
          );
        },
        backgroundColor: AppColors.menuRed,
        child: const Icon(
          Icons.add,
          color: AppColors.menuWhite,
        ),
      ),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppBar(
            title: 'Menu',
          )),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.027,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Stack(
                children: [
                  Image.asset('assets/images/pictures/e.png'),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.09,
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                              color: AppColors.menuRed,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 5,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF9CACA),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  height: 5,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: AppColors.menuWhite,
                                      borderRadius: BorderRadius.circular(5)),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 5,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFACCCD),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  height: 5,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFCEAEA),
                                      borderRadius: BorderRadius.circular(5)),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const Text(
            'Empty Menu',
            style: TextStyle(
                fontFamily: 'ProximaNova',
                color: AppColors.menuBlack,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            'You currently do not have an item on your menu.Tap',
            style: TextStyle(
              fontFamily: 'ProximaNova',
              color: AppColors.menuBlack.withOpacity(0.5),
            ),
          ),
          Text(
            'on the icon below to add.',
            style: TextStyle(
              fontFamily: 'ProximaNova',
              color: AppColors.menuBlack.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
