import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function press;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.isActive,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(children: [
          Text(
            title,
            style: isActive
                ? const TextStyle(
                fontFamily: "ProximaNova",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xff363636))
                : const TextStyle(
                fontFamily: "ProximaNova",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xff363636)),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 3,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffDC143C),
              ),
            ),
        ]),
      ),
    );
  }
}