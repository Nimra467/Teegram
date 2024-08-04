import 'package:flutter/material.dart';
import 'package:hackathon/Components/product_component.dart';
import 'package:hackathon/Components/product_model.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
          id: '1',
          productImage: "Assets/images/bag.png",
          name: "Leather Women Bag",
          description: "(715 reviews)",
          price: "\$135.00"),
      Product(
          id: '2',
          productImage: "Assets/images/headphone.png",
          name: "Wireless Headphone",
          description: "(379 reviews)",
          price: "\$65.00"),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Center(
            child: Text(
          "Popular Product",
          style: TextStyle(fontSize: 16),
        )),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: SingleChildScrollView(
          child: Row(
        children: products
            .map((product) => ProductComponent(
                  product: product,
                ))
            .toList(),
      )),
    );
  }
}
