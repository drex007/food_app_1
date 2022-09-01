import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trofira/core/models/vendorProfile.dart';
import 'package:trofira/core/utils/extensions.dart';
import 'package:trofira/ui/views/vendor/controller/vendor_controller.dart';
import 'package:trofira/ui/views/widgets/VendorCards.dart';

class FindBrandName extends StatefulWidget {
  const FindBrandName({Key? key}) : super(key: key);

  @override
  _FindBrandNameState createState() => _FindBrandNameState();
}

class _FindBrandNameState extends State<FindBrandName> {
  final vendorController = Get.find<VendorController>();

  List<VendorProfile> vendors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Set up Profile",
          style: TextStyle(
              color: Color(0xff363636),
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          children: [
            const Text(
              "Check if brand name is taken",
              style: TextStyle(
                  color: Color(0xff363636),
                  fontFamily: 'ProximaNova',
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            Center(
              child: Text(
                "Showing a total ${vendors.length} results.",
                style: const TextStyle(
                    fontFamily: "ProximaNova",
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 366,
              height: 48,
              child: TextField(
                textAlign: TextAlign.left,
                cursorColor: const Color(0xffB2B2B2),
                onChanged: (newSearchInput) async {
// {_id: 624043b1c58993d1ba92656f, userId: 622bb83b27682e044995ef2a, name: sdfsdf, facebookId: kkh, country: nigeria, instagramId: khkhjk, logo: https://res.cloudinary.com/trofira-africa/image/upload/v1648378606/gip01ro8fbxayjpc8xxv.jpg, phone: sdfdsfgdfhfghjkhjk, createdAt: 2022-03-27T11:00:01.996Z, status: active, services: [vendor], user: {_id: 624043b1c58993d1ba926570, fullName: Femi Bolaji, email: f@h.com}}
                  final searchRes =
                      await vendorController.searchVendors(newSearchInput);

                  setState(() {
                    vendors = (searchRes['data'] as List)
                        .map((vendor) => VendorProfile.fromJson(vendor))
                        .toList();
                  });
                },
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    isDense: true,
                    hintText: 'search brand name',
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
            // Todo: Implement a list view builder to load the data inside the single child scroll view
            SizedBox(
              height: 62.0.hp,
              child: ListView(
                padding: const EdgeInsets.all(15.0),
                children: vendors
                    .map((vendor) => VendorCard(vendorProfile: vendor))
                    .toList(),
              ),
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: TextButton(
              onPressed: () {
                Get.offAndToNamed("/brand_info");
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(0),
                )),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xffDC143C)),
              ),
              child: const Text(
                "Create your brand",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ProximaNova',
                  fontSize: 18,
                ),
              )),
        ),
      ],
    );
  }
}
