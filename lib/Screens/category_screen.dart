import 'package:flutter/material.dart';
import 'package:hackathon/Components/category_component.dart';
import 'package:hackathon/Screens/cart_screen.dart';
import 'package:hackathon/Screens/home_tab.dart';
import 'package:hackathon/Screens/wishlist.dart';
import 'package:hackathon/utils/colors.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  int myIndex = 0;
  List widgetList = [
    HomeTab(),
    WishlistScreen(),
    CartScreen(),
    Text("Home"),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Category",
          style: TextStyle(fontSize: 16),
        )),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
              color: purple, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nike Air Max 270",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      "Men's shoes",
                      style: TextStyle(
                        color: Color.fromRGBO(156, 160, 175, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "\$ 290.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
              Image.asset(
                "Assets/images/shoe.png",
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/bagicon.png",
                    categoryName: "Bag",
                  ),
                ),
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/watchicon.png",
                    categoryName: "Watches",
                  ),
                ),
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/shoeicon.png",
                    categoryName: "Shoe",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/jewelicon.png",
                    categoryName: "Jewelry",
                  ),
                ),
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/sporticon.png",
                    categoryName: "Sports",
                  ),
                ),
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/micicon.png",
                    categoryName: "Music",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/gifticon.png",
                    categoryName: "Gifts",
                  ),
                ),
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/flowericon.png",
                    categoryName: "Plant",
                  ),
                ),
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/gifticon.png",
                    categoryName: "Phone",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/furniturecion.png",
                    categoryName: "Furniture",
                  ),
                ),
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/cometic.png",
                    categoryName: "Cosmetic",
                  ),
                ),
                Expanded(
                  child: CategoryComponent(
                    categoryImage: "Assets/images/hobby.png",
                    categoryName: "Hobby",
                  ),
                ),
              ],
            ),
          ],
        ),
      
      ]),
    );
  }
}
