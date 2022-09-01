import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/ui/views/vendor/setup-brand-profile/find-brand-name/find_brand_name.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

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
          "Set Up Profile",
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
            const Center(
              child: Text(
                "Start typing below to find your brand name.",
                style: TextStyle(
                    fontFamily: "ProximaNova",
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ),
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
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              width: 366,
              child: TextButton(
                  onPressed: () {
                    Get.to(() => const FindBrandName());
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
                    "Search",
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
