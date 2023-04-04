import 'package:ecommerce_shop/models/product.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Product> products = [
    Product(
        name: 'Shirt',
        price: '500',
        description: 'Best seller shirt in the year',
        imgPath: 'assets/images/2.png'),
    Product(
        name: "T-Shirt",
        price: "1000",
        description: "All cotton classic Supreme t-shirt with printed graphic ",
        imgPath: 'assets/images/3.png'),
    Product(
        name: "Jean",
        price: "2000",
        description:
            "All cotton 13 oz. denim with zip-off flannel shirtsleeves at waist",
        imgPath: "assets/images/4.png"),
    Product(
        name: "Track Pant",
        price: "2200",
        description: "Water resistant nylon ripstop with embroidered pattern",
        imgPath: "assets/images/5.png")
  ];
  // list of products in user cart
  List<Product> userCart = [];
// get list of products for sale
  List<Product> getProductList() {
    return products;
  }

  // get cart
  List<Product> getCart() {
    return userCart;
  }

  // add item to cart
  void addItemToCart(Product product) {
    userCart.add(product);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Product product) {
    userCart.remove(product);
    notifyListeners();
  }
}
