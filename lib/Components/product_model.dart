class Product {
  final String id;
  final String productImage;
  final String name;
  final String description;
  final String price;

  Product({
    required this.id,
    required this.productImage,
    required this.name,
    required this.description,
    required this.price,
  });
}

List<Product> wishlist = [];
List<Product> cart = [];
