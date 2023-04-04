import 'package:flutter/material.dart';
import '../models/product.dart';
import '../components/product_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Make your own rules, Live your best life in Supreme.',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text('Hot picks🔥',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              Text('See all', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                Product product = Product(
                    name: 'Jacket',
                    price: '300',
                    description: 'Jacket beautiful in the world',
                    imgPath: 'assets/images/1.png');
                return ProductTile(
                  product: product,
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
    );
  }
}
