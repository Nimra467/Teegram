// import 'package:flutter/material.dart';

// class CategoryComponent extends StatelessWidget {
//   String categoryImage;
//   String categoryName;
//   CategoryComponent({required this.categoryImage, required this.categoryName});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       width: 100,
//       decoration: BoxDecoration(color: Colors.white),
//       child: Column(
//         children: [
//           Image.asset(
//             categoryImage,
//             color: Colors.grey,
//             height: 50,
//           ),
//           Text(categoryName),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final String categoryImage;
  final String categoryName;
  final Color color;

  CategoryComponent(
      {required this.categoryImage,
      required this.categoryName,
      this.color = Colors.white,
      t // default color
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5)),
            child: Image.asset(
              categoryImage,
              // color:iconColor ,
              height: 50,
            ),
          ),
          SizedBox(height: 10),
          Text(categoryName),
        ],
      ),
    );
  }
}
