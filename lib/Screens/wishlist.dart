import 'package:flutter/material.dart';
import 'package:hackathon/Components/product_model.dart';

class WishlistScreen extends StatefulWidget {
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "WishList",
            style: TextStyle(fontSize: 16),
          )),
        ),
        body: ListView(children: [
          ...wishlist.map((product) => ListTile(
                leading: Image.asset(product.productImage),
                title: Text(product.name),
                subtitle: Text(product.description),
                trailing: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    // Remove from wishlist
                    wishlist.remove(product);
                    // Refresh the UI
                    (context as Element).reassemble();
                  },
                ),
              )),
        ]));
  }
}
