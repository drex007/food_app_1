import 'package:flutter/material.dart';
import 'cuisine_description.dart';

class CuisineCard extends StatelessWidget {
  final Cuisine cuisine;

  const CuisineCard({
    Key? key,
    required this.cuisine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 175,
      height: 241,
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
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(cuisine.image),
                )),
          ),
          Text(cuisine.title,
              style: const TextStyle(
                  fontFamily: "ProximaNova",
                  color: Color(0xff363636),
                  fontWeight: FontWeight.w600,
                  fontSize: 14)),
          const SizedBox(height: 10),
          Text(
            cuisine.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: "ProximaNova",
                color: Color(0xff363636),
                fontWeight: FontWeight.w400,
                fontSize: 10),
          ),
          const SizedBox(height: 10),
          Text(
            "\N${cuisine.price}",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: "ProximaNova",
                color: Color(0xff363636),
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                child: Hero(
                    tag: "${cuisine.id}",
                    child: IconButton(
                      padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xffDC143C),
                        ),

                    )),
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
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
