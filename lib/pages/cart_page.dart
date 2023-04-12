import 'dart:convert';

import 'package:ecommerce_shop/models/cart.dart';
import 'package:ecommerce_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) {
      return FutureBuilder(
        future: getCartItem(),
        builder: (context, snapshot) {
          List<Product> cartItems = [];
          if (snapshot.hasData) {
            cartItems = snapshot.data as List<Product>;
          }
          if (cartItems.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'My cart',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(height: 300),
                  Center(
                    child: Text(
                      'Your cart is empty !',
                      style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
                    ),
                  ),
                ],
              ),
            );
          }
          double total = 0.0;
          for (Product product in cartItems) {
            total += product.price;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My cart',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      Product individuaProduct = cartItems[index];
                      return CartItem(
                        product: individuaProduct,
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Total: \$${total.toStringAsFixed(0)}',
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[600],
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        print(cartItems);
                        value.clearCart();
                        setState(() {
                          total = 0;
                        });
                      },
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Roboto"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    });
  }
}

Future<List<Product>?> getCartItem() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('cart') != null
      ? List.castFrom<dynamic, Product>(json
          .decode(prefs.getString('cart') ?? '')
          .map((data) => Product.fromJson(data))
          .toList())
      : null;
}
