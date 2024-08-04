import 'package:flutter/material.dart';
import 'package:hackathon/Components/product_model.dart';
import 'package:hackathon/utils/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Center(
            child: Text(
          "Cart",
          style: TextStyle(fontSize: 16),
        )),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: ListView(children: [
        ...cart.map(
          (product) => Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            product.description,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        product.price,
                        style: TextStyle(color: purple),
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // Remove from cart
                      wishlist.remove(product);
                      // Refresh the UI
                      (context as Element).reassemble();
                    },
                  ),
                  Image.asset(product.productImage)
                ],
              ),
            ),
          ),
          // ListTile(
          //   leading: Image.asset(product.productImage),
          //   title: Text(product.name),
          //   subtitle: Text(product.description),
          //   trailing: IconButton(
          //     icon: Icon(
          //       Icons.remove,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          //       // Remove from wishlist
          //       wishlist.remove(product);
          //       // Refresh the UI
          //       (context as Element).reassemble();
          //     },
          //   ),
          // )
        ),
      ]),
    );
  }
}
