import 'package:flutter/material.dart';
import 'package:hackathon/Components/product_model.dart';
import 'package:hackathon/Screens/product_detail.dart';
import 'package:hackathon/utils/colors.dart';

class ProductComponent extends StatefulWidget {
  final Product product;

  ProductComponent({
    required this.product,
  });

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  late bool isInWishlist;

  @override
  void initState() {
    super.initState();
    isInWishlist = wishlist.contains(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailScreen(product: widget.product)),
          );
        },
        child: Container(
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      isInWishlist ? Icons.favorite : Icons.favorite_border,
                      color: isInWishlist ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isInWishlist) {
                          wishlist.remove(widget.product);
                        } else {
                          wishlist.add(widget.product);
                        }
                        isInWishlist = !isInWishlist;
                      });
                    },
                  ),
                ],
              ),
              Image.asset(
                widget.product.productImage,
                height: 100,
                width: 130,
              ),
              Text(
                widget.product.name,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    widget.product.description,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Text(
                widget.product.price,
                style: TextStyle(color: purple),
              )
            ],
          ),
        ),
      ),
    );
  }
}
