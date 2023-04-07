import 'package:ecommerce_shop/models/cart.dart';
import 'package:ecommerce_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      final List<Product> cartItems = value.getUserCart();
      if (cartItems.isEmpty) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'My cart',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 300),
              Center(
                child: Text(
                  'Your cart is empty !',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My cart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
                child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
                Product individuaProduct = value.getUserCart()[index];
                return CartItem(
                  product: individuaProduct,
                );
              },
            ))
          ],
        ),
      );
    });
  }
}
