import "package:flutter/material.dart";
import 'package:trofira/core/models/vendorProfile.dart';
import 'package:trofira/core/utils/extensions.dart';

class VendorCard extends StatelessWidget {
  final VendorProfile vendorProfile;

  VendorCard({Key? key, required this.vendorProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 46,
                  height: 46,
                  child: Image.network(vendorProfile.logo ?? ""),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vendorProfile.name,
                      style: const TextStyle(
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      width: 54,
                      height: 14,
                      child: Center(
                        child: Text(
                          vendorProfile.country ?? "",
                          style: const TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.w400,
                              fontSize: 9),
                        ),
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
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 14.25,
                  height: 14.25,
                  child: Image.asset('assets/images/icons/Call.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  vendorProfile.phone ?? "",
                  style: const TextStyle(
                    color: Color(0xff363636),
                    fontFamily: 'ProximaNova',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 14.25,
                  height: 14.25,
                  child: Image.asset('assets/images/icons/Message.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  vendorProfile.user?.email ?? "",
                  style: const TextStyle(
                    color: Color(0xff363636),
                    fontFamily: 'ProximaNova',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 14.25,
                  height: 14.25,
                  child: Image.asset('assets/images/icons/Location.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Building Material Market, Jos",
                  style: TextStyle(
                    color: Color(0xff363636),
                    fontFamily: 'ProximaNova',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ],
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
    );
  }
}
