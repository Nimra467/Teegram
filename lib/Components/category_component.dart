import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  String categoryImage;
  String categoryName;
  CategoryComponent({required this.categoryImage, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Image.asset(
            categoryImage,
            color: Colors.grey,
            height: 50,
          ),
          Text(categoryName),
        ],
      ),
    );
  }
}
