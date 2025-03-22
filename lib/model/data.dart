


import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';

class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'NIKE AIR MAX 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/shooe_tilt_1.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'NIKE AIR MAX 97',
        price: 220.00,
        isliked: false,
        image: 'assets/shoe_tilt_2.png',
        category: "Trending Now"),
  ];
  static List<Product> cartList = [
    Product(
        id: 1,
        name: 'NIKE AIR MAX 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/small_tilt_shoe_1.png',
        category: "Trending Now"),
 
    Product(
        id: 1,
        name: 'NIKE AIR MAX 92607',
        price: 220.00,
        isliked: false,
        image: 'assets/small_tilt_shoe_3.png',
        category: "Trending Now"),


  ];
  static List<Category> categoryList = [
    Category(),
    Category(
        id: 1,
        name: "Sneakers",
        image: 'assets/small_tilt_shoe_1.png',
        isSelected: true),
    Category(id: 2, name: "Jacket", image: 'assets/jacket.png'),
    Category(id: 3, name: "Watch", image: 'assets/watch.png'),

  ];
  static List<String> showThumbnailList = [
    "assets/shoe_thumb_5.png",
    "assets/shoe_thumb_1.png",
    "assets/shoe_thumb_4.png",
    "assets/shoe_thumb_2.png",
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the NIKE AIR MAX 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The NIKE AIR MAX 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}