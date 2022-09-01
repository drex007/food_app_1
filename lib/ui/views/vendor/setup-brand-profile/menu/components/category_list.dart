import 'package:flutter/material.dart';

import 'category_item.dart';



class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryItem(title: "All", isActive: true, press: () {}),
              CategoryItem(title: "African", isActive: false, press: () {}),
              CategoryItem(title: "Snacks", isActive: false, press: () {}),
              CategoryItem(title: "Drinks", isActive: false, press: () {}),
              CategoryItem(title: "Veggies", isActive: false, press: () {}),
            ],
          )),
    );
  }
}