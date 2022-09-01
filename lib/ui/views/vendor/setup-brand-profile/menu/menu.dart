import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/ui/views/vendor/setup-brand-profile/add_logo/add_logo.dart';
import 'package:trofira/ui/views/vendor/setup-brand-profile/menu/components/cuisine_card.dart';
import 'package:trofira/ui/views/vendor/setup-brand-profile/menu/components/cuisine_description.dart';
import 'components/category_list.dart';
import 'dart:io' show Platform;

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

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
          "Menu",
          style: TextStyle(
              color: Color(0xff363636),
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 366,
              height: 48,
              child: const TextField(
                textAlign: TextAlign.left,
                cursorColor: Color(0xffB2B2B2),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    isDense: true,
                    hintText: 'Enter your name',
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(
                      color: Color(0xffB2B2B2),
                      fontFamily: 'ProximaNova',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(),
                      child: Icon(
                        Icons.search_rounded,
                        color: Color(0xffB2B2B2),
                      ),
                    )),
              ),
              decoration: BoxDecoration(
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
                color: Colors.white,
              ),
            ),
            const CategoryList(),
            const SizedBox(
              height: 10,
            ),

            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView.builder(
                  itemCount: cuisines.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.70,


                  ),
                  itemBuilder: (context, index) => CuisineCard(
                        cuisine: cuisines[index],
                      )),
            )),
            SizedBox(
              height: 48,
              width: 366,
              child: TextButton(
                  onPressed: () {
                    Get.to(() => const AddLogo());
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(15),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffDC143C)),
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ProximaNova',
                      fontSize: 18,
                    ),
                  )),
            ),
          ],
        ),
      ),

    );
  }
}
