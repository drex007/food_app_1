import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trofira/core/constants/trofira_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.menuWhite,
      appBar: AppBar(
        backgroundColor: AppColors.menuWhite,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style:
              TextStyle(color: AppColors.menuBlack, fontFamily: 'ProximaNova'),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.menuBlack,
            )),
      ),
    );
  }
}
