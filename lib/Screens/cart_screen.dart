import 'package:flutter/material.dart';
import 'package:hackathon/Components/product_model.dart';
import 'package:hackathon/Screens/wishlist.dart';
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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistScreen()),
              );
            },
            icon: Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: ListView(children: [
        ...cart.map(
          (product) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              // child:
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
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
                      Icons.delete,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // Remove from cart
                      cart.remove(product);
                      // Refresh the UI
                      (context as Element).reassemble();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(product.productImage),
                  )
                ],
              ),
              // ),
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
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "select Item:",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Subtotal:",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Discount(%20)",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Total:",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "1",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$589.00",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$117.80",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "\$471.20",
                      style: TextStyle(color: purple, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Checkout',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: purple,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
