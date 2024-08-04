import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Screens/category_screen.dart';
import 'package:hackathon/Screens/home_tab.dart';
import 'package:hackathon/Screens/wishlist.dart';
import 'package:hackathon/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;
  List widgetList = [
    HomeTab(),
    WishlistScreen(),
    Text("Home"),
    Text("Home"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: purple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: "favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "user")
        ],
      ),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Home",
          style: TextStyle(fontSize: 16),
        )),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: Drawer(),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Category"),
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
                    borderRadius: BorderRadius.circular(5),
                  ),
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
                  HomeTab(),
                  Text("Home"),
                  Text("Home"),
                  Text("Home"),
                  Text("Home"),
                ]),
              ),
            ],
          ),
        ),
        widgetList[myIndex],
      ]),
    );
  }
}
