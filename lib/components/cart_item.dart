import 'package:ecommerce_shop/models/cart.dart';
import 'package:ecommerce_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Product product;
  CartItem({super.key, required, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false)
        .removeItemFromCart(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        leading: Image.asset(
          widget.product.imgPath,
        ),
        title: Text(widget.product.name),
        subtitle: Text('\$${widget.product.price}'),
        trailing: IconButton(
            icon: const Icon(Icons.delete), onPressed: removeItemFromCart),
      ),
    );
  }
}
