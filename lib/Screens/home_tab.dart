import 'package:flutter/material.dart';
import 'package:hackathon/Components/product_component.dart';
import 'package:hackathon/Components/product_model.dart';
import 'package:hackathon/Screens/category_screen.dart';
import 'package:hackathon/Screens/popular_product.dart';
import 'package:hackathon/utils/colors.dart';

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
      appBar: AppBar(
        title: Center(
            child: Text(
          "Home",
          style: TextStyle(fontSize: 16),
        )),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView(children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
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
                  Positioned(
                    child: Image.asset(
                      "Assets/images/shoe.png",
                      // height: 300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryScreen()),
                    );
                  },
                  child: Text("See All"))
            ],
          ),
        ),
        DefaultTabController(
          length: 5,
          initialIndex: 0,
          child: Column(
            children: [
              Container(
                child: TabBar(
                  labelStyle: TextStyle(color: Colors.white),
                  isScrollable: true,
                  indicator: BoxDecoration(
                    // shape: BoxShape.rectangle,
                    color: purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.only(bottom: 4),
                  tabs: [
                    Tab(
                      text: "All",
                    ),
                    Tab(
                      text: "Electronic",
                    ),
                    Tab(
                      text: "Fashion",
                    ),
                    Tab(
                      text: "Shoes",
                    ),
                    Tab(
                      text: "Furniture",
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Popular products"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PopularProduct()),
                              );
                            },
                            child: Text("See All"))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: products
                            .map((product) => ProductComponent(
                                  product: product,
                                ))
                            .toList(),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: products
                          .map((product) => ProductComponent(
                                product: product,
                              ))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: products
                          .map((product) => ProductComponent(
                                product: product,
                              ))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: products
                          .map((product) => ProductComponent(
                                product: product,
                              ))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: products
                          .map((product) => ProductComponent(
                                product: product,
                              ))
                          .toList(),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Latest Products"),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PopularProduct()),
                  );
                },
                child: Text("See All")),
          ],
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.white,
              leading: Image.asset("Assets/images/headphone.png"),
              title: Text("Headphone Holder"),
              subtitle: Text(
                "\$34.90",
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.w700),
              ),
              trailing: Text(
                "(1446)",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
