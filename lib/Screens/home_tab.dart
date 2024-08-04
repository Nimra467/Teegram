import 'package:flutter/material.dart';
import 'package:hackathon/Components/product_component.dart';
import 'package:hackathon/Components/product_model.dart';
import 'package:hackathon/Screens/popular_product.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

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
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Popular products"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PopularProduct()),
                    );
                  },
                  child: Text("See All"))
            ],
          ),
          Row(
            children: products
                .map((product) => ProductComponent(
                      product: product,
                    ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Latest Products"),
              TextButton(onPressed: () {}, child: Text("See All")),
            ],
          ),
          Container(
            child: ListTile(
              leading: Image.asset("Assets/images/headphone.png"),
              title: Text("Headphone Holder"),
              subtitle: Text("\$34.90"),
              trailing: Text(("1446")),
            ),
          )
        ]),
      ),
    );
  }
}
