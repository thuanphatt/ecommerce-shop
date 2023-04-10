import 'dart:convert';

import 'package:ecommerce_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends ChangeNotifier {
  List<Product> products = [
    Product(
        id: 1,
        name: 'Hooded Sweatshirt',
        price: 10000,
        description: 'Brushed-back fleece with pouch pocket',
        imgPath: 'assets/images/1.png'),
    Product(
        id: 2,
        name: 'Flannel Shirt',
        price: 5000,
        description: 'Best seller flannel shirt in the year',
        imgPath: 'assets/images/2.png'),
    Product(
        id: 3,
        name: "Face Tee",
        price: 1000,
        description: "All cotton classic Supreme t-shirt with printed graphic ",
        imgPath: 'assets/images/3.png'),
    Product(
        id: 4,
        name: "Jean Slimfit",
        price: 1500,
        description: "All cotton classic Supreme Jean with printed graphic ",
        imgPath: 'assets/images/4.png'),
    Product(
        id: 5,
        name: "Chain Zippo®",
        price: 2000,
        description: "Zippo® with debossed logo and removable 20 chain.",
        imgPath: "assets/images/5.png"),
    Product(
        id: 6,
        name: 'Hoddie Winter',
        price: 4400,
        description: 'Best seller Hoddie in the year',
        imgPath: 'assets/images/6.png'),
    Product(
        id: 7,
        name: "Field Backpack",
        price: 5500,
        description: "Water resistant nylon ripstop with embroidered pattern",
        imgPath: "assets/images/7.png"),
    Product(
        id: 8,
        name: "Stacked Sweater",
        price: 5500,
        description: "Water resistant nylon ripstop with embroidered pattern",
        imgPath: "assets/images/8.png"),
    Product(
        id: 9,
        name: "Hype Hat",
        price: 3500,
        description: "Water resistant nylon ripstop with embroidered pattern",
        imgPath: "assets/images/9.png"),
    Product(
        id: 10,
        name: "Basic Tee",
        price: 2500,
        description: "Water resistant nylon ripstop with embroidered pattern",
        imgPath: "assets/images/10.png"),
  ];

  // list of products in user cart
  List<Product> userCart = [];
// get list of products for sale
  List<Product> getProductList() {
    return products;
  }

  // get cart
  List<Product> getUserCart() {
    return userCart;
  }

  // add item to cart
  void addItemToCart(Product product) {
    userCart.add(product);
    setCartItem(userCart);
    notifyListeners();
  }

  void clearCart() {
    return userCart.clear();
  }

  // remove item from cart
  void removeItemFromCart(Product product) {
    userCart.remove(product);
    setCartItem(userCart);
    notifyListeners();
  }
}

void setCartItem(List<Product> cartItem) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('cart', json.encode(cartItem));
}
