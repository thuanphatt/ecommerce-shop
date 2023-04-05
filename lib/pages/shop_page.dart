import 'package:ecommerce_shop/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../components/product_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addProductToCart(Product product) {
    Provider.of<Cart>(context, listen: false).addItemToCart(product);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Successfully",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Icon(
                      Icons.check_box_rounded,
                      color: Colors.green,
                      size: 16.0,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Check your cart",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          )
        ],
        // icon: Icon(Icons.check),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          _searchInputSection(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Make your own rules, Live your best life in Supreme.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          _hotpickSection(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Product product = value.getProductList()[index];
                  return ProductTile(
                    product: product,
                    onTap: () => addProductToCart(product),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
            child: Divider(
              color: Colors.grey[300],
            ),
          )
        ],
      ),
    );
  }

  Padding _hotpickSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text('Most Popular',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          Text('See all', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Container _searchInputSection() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Search',
              style: TextStyle(color: Colors.grey),
            ),
            Icon(
              Icons.search,
              color: Colors.grey,
            )
          ]),
    );
  }
}
