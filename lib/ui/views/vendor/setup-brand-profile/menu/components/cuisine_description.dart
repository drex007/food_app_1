import 'package:flutter/material.dart';

class Cuisine {
  final String image, title, description;
  final int price, id;

  Cuisine({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });
}

List<Cuisine> cuisines = [
  Cuisine(
      id: 1,
      image: 'assets/images/cuisines/spicy_fish_source.png',
      title: "Spicy fish sauce",
      description: "This tasty and delicious fish pairs with yam, bread or pasta.",
      price: 5000,
),
  Cuisine(
    id: 2,
    image: 'assets/images/cuisines/vegetable_tomato_mix.png',
    title: "Vegetable tomato mix",
    description: "This tasty and delicious fish pairs with yam, bread or pasta.",
    price: 5000,
  ),

  Cuisine(
    id: 3,
    image: 'assets/images/cuisines/spicy_fish_sauce2.png',
    title: "Spicy fish sauce",
    description: "This tasty and delicious fish pairs with yam, bread or pasta.",
    price: 5000,
  ),

  Cuisine(
    id: 4,
    image: 'assets/images/cuisines/spicy_fish_sauce3.png',
    title: "Spicy fish sauce",
    description: "This tasty and delicious fish pairs with yam, bread or pasta.",
    price: 5000,
  )
];

