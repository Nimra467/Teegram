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
        body: ListView(children: [
      ListTile(
          title: Text("wishlist"),
          trailing: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          )),
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
                wishlist.remove(Product);
                // Refresh the UI
                (context as Element).reassemble();
              },
            ),
          )),
    ]));
  }
}
