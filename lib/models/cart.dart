import 'package:ecommerce_shop/models/product.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Product> products = [
    Product(
        name: 'Hooded Sweatshirt',
        price: 10000,
        description: 'Brushed-back fleece with pouch pocket',
        imgPath: 'assets/images/1.png'),
    Product(
        name: 'Flannel Shirt',
        price: 5000,
        description: 'Best seller flannel shirt in the year',
        imgPath: 'assets/images/2.png'),
    Product(
        name: "Face Tee",
        price: 1000,
        description: "All cotton classic Supreme t-shirt with printed graphic ",
        imgPath: 'assets/images/3.png'),
    Product(
        name: "Jean Slimfit",
        price: 1500,
        description: "All cotton classic Supreme Jean with printed graphic ",
        imgPath: 'assets/images/4.png'),
    Product(
        name: "Chain Zippo®",
        price: 2000,
        description: "Zippo® with debossed logo and removable 20 chain.",
        imgPath: "assets/images/5.png"),
    Product(
        name: 'Hoddie Winter',
        price: 4400,
        description: 'Best seller Hoddie in the year',
        imgPath: 'assets/images/6.png'),
    Product(
        name: "Field Backpack",
        price: 5500,
        description: "Water resistant nylon ripstop with embroidered pattern",
        imgPath: "assets/images/7.png"),
    Product(
        name: "Stacked Sweater",
        price: 5500,
        description: "Water resistant nylon ripstop with embroidered pattern",
        imgPath: "assets/images/8.png"),
    Product(
        name: "Hype Hat",
        price: 3500,
        description: "Water resistant nylon ripstop with embroidered pattern",
        imgPath: "assets/images/9.png"),
    Product(
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
    notifyListeners();
  }

  void clearCart() {
    return userCart.clear();
  }

  // remove item from cart
  void removeItemFromCart(Product product) {
    userCart.remove(product);
    notifyListeners();
  }
}
