import 'package:ecommerce_shop/models/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  Product product;
  ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, top: 4, bottom: 4),
      width: 280,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 4,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(product.imgPath)),
          Text(
            product.description,
            style: const TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    child: const Icon(Icons.add, color: Colors.white))
              ],
            ),
          )
        ],
      ),
    );
  }
}
