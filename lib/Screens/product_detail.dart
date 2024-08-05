import 'package:flutter/material.dart';
import 'package:hackathon/Components/product_model.dart';
import 'package:hackathon/Screens/cart_screen.dart';
import 'package:hackathon/Screens/wishlist.dart';
import 'package:hackathon/utils/colors.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  int count = 0;
  ProductDetailScreen({required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late bool isInCart;

  @override
  void initState() {
    super.initState();
    isInCart = cart.contains(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Product Detail"),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            
            ClipOval(child: Image.asset(widget.product.productImage)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  widget.product.price,
                  style: TextStyle(
                      color: purple, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Text(
              widget.product.description,
              style: TextStyle(color: Colors.grey),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
              ],
            ),
            Text("Color"),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.purple,
                ),
                CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
            Text("About"),
            Text(
                "Maecenas cursus magna vitae convallis congue. Vestibulum dignissim augue odio, congue rutrum magna gravida ac. Sed rhoncus eu arcu a tempus."),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CartScreen()),
                  // );
                  setState(() {
                    // isInCart ? count+=1 :count,
                    if (isInCart) {
                      cart.remove(widget.product);
                    } else {
                      cart.add(widget.product);
                    }
                    isInCart = !isInCart;
                  });
                },
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
