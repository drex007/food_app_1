import 'package:flutter/material.dart';
import '../../../../core/constants/assets_paths.dart';

class OrderDetails{
  final String name, dish, description, image;
  final int price, id;

  OrderDetails({
    required this.id,
    required this.image,
    required this.name,
    required this.dish,
    required this.description,
    required this.price
  });
}


List<OrderDetails> orders = [
  OrderDetails(
    id: 1,
    image: AssetPaths.orderPicture,
    name: "Hassan Benjamin",
    dish: "Fried Rice",
    description: "5 plates + 5 Smoothies.",
    price: 7000,
  ),

  OrderDetails(
    id: 2,
    image: AssetPaths.orderPicture,
    name: "Richman Oti",
    dish: "Egusi and Semo",
    description: "5 plates + 5 Smoothies.",
    price: 5000,
  ),

  OrderDetails(
    id: 3,
    image: AssetPaths.orderPicture,
    name: "Temisan Jordan",
    dish: "Fried Rice",
    description: "5 plates + 5 Smoothies.",
    price: 9000,
  ),

  OrderDetails(
    id: 4,
    image: AssetPaths.orderPicture,
    name: "Benjamin Apkos",
    dish: "Chicken and Chips",
    description: "5 plates + 5 Smoothies.",
    price: 5000,
  ),
];